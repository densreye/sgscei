using Microsoft.AspNetCore.Mvc;
using sistema_gestion_solicitudes.Models;
using Microsoft.EntityFrameworkCore;
using System.Text;
using System.Security.Cryptography;


namespace sistema_gestion_solicitudes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {

        private readonly GestionContext DBContext;
        private readonly ILogger<UserController> logger;

        public UserController(GestionContext DBContext, ILogger<UserController> logger)
        {
            this.DBContext = DBContext;
            this.logger=logger;
        }
        [HttpGet]

        public async Task<ActionResult<IEnumerable<User>>> GetUsuarios()
        {
            var usuarios = await DBContext.Users
                        .Include(e => e.Especialidades)
                        .Include(e=> e.Roles)
                        .ToListAsync();

            return usuarios;
        }


        [HttpGet]
        [Route("/api/RevisoresDisponibles")]

        public async Task<ActionResult<IEnumerable<User>>> GetRevisoresDisponibles()
        {
            var usuarios = await DBContext.Users.Where(s => s.Estado == true && s.Roles.Any(s => s.Nombre =="Miembro del Comité"))
                        .ToListAsync();

            return usuarios;
        }



        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            if (DBContext.Users == null)
            {
                return NotFound();
            }
            var usuario = await DBContext.Users
                            .Include(e => e.Especialidades)
                            .Include(e => e.Roles)
                            .FirstOrDefaultAsync(s => s.Id == id);
;
              

            if (usuario == null)
            {
                return NotFound();
            }

            return usuario;
        }



        [HttpPost]
        [Route("/api/Register")]
        public async Task<IActionResult> PostUser(User usuario)
        {
            try
            {

                if (!ModelState.IsValid || await DBContext.Users.AnyAsync(x => x.Correo == usuario.Correo || x.Username == usuario.Username || x.Cedula == usuario.Cedula))
                {
                    return BadRequest();
                }
                else
                {
                    this.logger.LogWarning(usuario.ContrasenaHash);
                    if (usuario.ContrasenaHash != null)
                    {
                        usuario.ContrasenaHash = HashPassword(usuario.ContrasenaHash);
                    }


                    usuario.FechaCreacion = DateTime.Now;
                    DBContext.Users.Add(usuario);
                    DBContext.SaveChanges();
                    return Ok();

                }
            }
            catch (DbUpdateException ex)
            {
                // Log the detailed error
                this.logger.LogError("An error occurred while updating the database.", ex);
                // Devuelve una respuesta con el error
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.InnerException?.Message ?? ex.Message });
            }

        }

        [HttpPut]
        [Route("/api/User/{id}")]
        public async Task<IActionResult> PutSolicitud(int id, User usuario)
        {
            if (id != usuario.Id)
            {
                return BadRequest();
            }

            var usuarioExistente = await DBContext.Users.FirstOrDefaultAsync(u => u.Id == id);
            if (usuarioExistente == null)
            {
                return NotFound();
            }

            usuarioExistente.Nombres = usuario.Nombres;
            usuarioExistente.Apellidos = usuario.Apellidos;
            usuarioExistente.Username = usuario.Username;
            usuarioExistente.Correo = usuario.Correo;
            usuarioExistente.Cedula = usuario.Cedula;
            usuarioExistente.Estado = usuario.Estado;

            try
            {
                await DBContext.SaveChangesAsync();
            }
            catch (DbUpdateException ex)
            {
                // Log the detailed error
                this.logger.LogError("An error occurred while updating the database.", ex);
                // Devuelve una respuesta con el error
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.InnerException?.Message ?? ex.Message });
            }
            return Ok();
        }


        private bool UserExists(int id)
        {
            return (DBContext.Users?.Any(e => e.Id == id)).GetValueOrDefault();
        }

        public class LoginRequest
        {
            public string Username { get; set; }
            public string Correo { get; set; }
            public string ContrasenaHash { get; set; }
        }

        [HttpPost]
        [Route("api/login")]
        public async Task<IActionResult> LoginUser(LoginRequest loginRequest)
        {
            if (loginRequest.Correo != null && loginRequest.ContrasenaHash != null)
            {
                loginRequest.ContrasenaHash = HashPassword(loginRequest.ContrasenaHash);

                // Obtener el usuario y sus roles por correo electrónico
                var user = await DBContext.Users
                                          .Include(u => u.Roles) // Incluir los roles del usuario en la consulta
                                          .FirstOrDefaultAsync(u => u.Correo == loginRequest.Correo &&
                                                                    u.ContrasenaHash == loginRequest.ContrasenaHash);

                // Si el usuario no existe o la contraseña no coincide, devolver un error
                if (user == null)
                {
                    return BadRequest("Credenciales inválidas.");
                }

                // Verificar si el usuario tiene el rol de "usuario externo"
                var hasExternalUserRole = user.Roles.Any(r => r.Nombre == "Usuario Externo");
                if (!hasExternalUserRole)
                {
                    return BadRequest("El usuario no tiene el rol de usuario externo.");
                }

                // El usuario tiene credenciales válidas y es un usuario externo, proceder a devolver la respuesta de éxito
                var result = new
                {
                    Success = true,
                    Message = "Usuario autenticado con éxito como usuario externo."
                };

                return Ok(result); // Retornar el objeto como JSON
            }
            else
            {
                return BadRequest("Correo y contraseña son requeridos.");
            }
        }




        [HttpPost]
        [Route("/api/NewUsers")]
        public async Task<IActionResult> CreateUser(User usuario)
        {
            if (!ModelState.IsValid || await DBContext.Users.AnyAsync(x => x.Correo == usuario.Correo || x.Username == usuario.Username))
            {
                return BadRequest();
            }
            else
            {
                var user = new User
                {
                    Nombres = usuario.Nombres,
                    Apellidos = usuario.Apellidos,
                    Cedula = usuario.Cedula,
                    Username = usuario.Username,
                    Correo = usuario.Correo,
                    Estado = usuario.Estado,
                    FechaCreacion = DateTime.Now
                };

                foreach (Especialidad esp in usuario.Especialidades)
                {
                    var especialidad = DBContext.Especialidades.FirstOrDefault(e => e.Id == esp.Id);
                   
                    {
                        if (especialidad != null)
                        {
                            
                            user.Especialidades.Add(especialidad);
                            especialidad.Usuarios.Add(user);
                            
                        }
                    }
                }
                foreach (Role rol in usuario.Roles)
                {
                    var role = DBContext.Roles.Find(rol.Id);
                    {
                        if (role != null)
                        {
                            user.Roles.Add(role);
                            role.Usuarios.Add(user);
                        }
                           
                    }
                }
                
                DBContext.Users.Add(user);
                await DBContext.SaveChangesAsync();


                return Ok();

            }

        }

        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }


    }
}

