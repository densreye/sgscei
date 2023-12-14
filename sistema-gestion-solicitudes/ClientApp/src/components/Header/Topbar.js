import MenuIcon from '@mui/icons-material/Menu';
import { Button, IconButton } from '@mui/material';
import Notification from "./NotificationSection/Notification";
import ProfileUser from "./ProfileSection/ProfileUser";
import NavComite from './NavComite';
import { useNavigate } from 'react-router-dom';

const Topbar = ({ toggleSidebar }) => {

    const navigate = useNavigate();

    const handleLogout = () => {
        // Aquí iría la lógica para cerrar la sesión del usuario
        localStorage.removeItem('userEspol'); // Suponiendo que así es como guardas la sesión
    
        // Mostrar un mensaje de confirmación
        console.log('Sesión cerrada con éxito');
        setTimeout(()=>{
            navigate('/welcome');
        },2000)        
        // Aquí podrías usar un sistema de notificaciones o alertas si tienes uno
      };

    return (
        <>

            <div className=" d-flex flex-column p-0">         
                <div className="d-flex justify-content-between">
                        <IconButton
                            onClick={toggleSidebar}
                        >
                            <MenuIcon />
                        </IconButton>
                        <div className="my-2 my-lg-0">
                            <Notification />
                            <ProfileUser />

                        <Button size="small" onClick={handleLogout}>
                                    Cerrar Sesion
                             
                            </Button>
                        </div>
                </div>
                <div className="Comite p-2 rounded">
                    <NavComite />
                </div>
            </div>
           
        </>
  );
};

export default Topbar;
