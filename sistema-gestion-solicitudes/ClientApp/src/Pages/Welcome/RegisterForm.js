import {
    Grid, Box, AppBar, Toolbar, Button,
    Typography, CardMedia, Divider
} from "@mui/material"
import { useEffect, useState } from "react";
import Footer from "../../components/Footer/Footer";
import { ButtonStyled } from "../../Utils/CustomStyles";
import logo from "../../assets/logo.png";
import FormikControl from "../../components/Form/FormControl";
import { Formik, Form } from "formik";
import * as yup from "yup";
import banner from "../../assets/banner.jpg";
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import SnackbarComponent from "../../components/Snackbar";
import { API_URL } from "../../Utils/Variables";
import { useNavigate } from 'react-router-dom';



const RegisterPage = () => {
    const navigate = useNavigate();
            

    const [message, setMessage] = useState("");
    const [severity, setSeverity] = useState("");
    const [open, setOpen] = useState(false);
   

    const initialValues = {
        nombres: "",
        apellidos: "",
        cedula: "",
        username: "",
        correo: "",
        contrasena: "",
        confirmacion:"",


    };

    const onSubmit = async (values, { resetForm }) => {
        const dataRegistro = JSON.stringify({
            Nombres: values.nombres,
            Apellidos: values.apellidos,
            Cedula: values.cedula,
            Username: values.username,
            Correo: values.correo,
            ContrasenaHash: values.contrasena,
            Estado: true,

        })

        console.log("data user before register: ",dataRegistro);

        console.log(dataRegistro);
        let res = await fetch(API_URL + "/Register", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: dataRegistro,
        })
        if (res.status === 200) {
            setMessage('Usuario registrado exitosamente')
            setSeverity('success');
            setOpen(true);
            resetForm({});

            setTimeout(()=>{
                navigate('/welcome');
            },3000)
        }
        else {
            setMessage('Error al crear usuario')
            setSeverity('error');
            setOpen(true);


        }


    }

    const validationSchema = yup.object({
        nombres: yup
            .string()
            .min(2, "Ingrese más de 2 caracteres")
            .required("Nombre requerido"),
        apellidos: yup
            .string()
            .min(2, "Ingrese más de 2 caracteres")
            .required("Apellido requerido"),
        cedula: yup
            .string()
            .required('Campo requerido')
            .matches(/^[0-9]+$/, "Debe ingresar solo numeros")
            .length(10, 'Campo debe contener 10 caracteres'),
        username: yup
            .string()
            .required('Campo requerido'),
        correo: yup
            .string()
            .email('Formato de email incorrecto')
            .required('Campo requerido'),
        contrasena: yup
            .string()
            .required('Campo requerido'),
        confirmacion: yup
            .string()
            .required('Campo requerido')
            .oneOf([yup.ref('contrasena')], 'Contrasenas deben coincidir'),


    });


    const handleCloseSnackBar = (event, reason) => {
       
        setOpen(false);
    };

    





    return (

        <>
            <Box sx={{
                display: 'grid',
                height: '90vh',
                gridTemplateRows: 'auto 85% 15%',
                gridTemplateAreas: `"header header header header"
                                          "main  right right right"
                                          "footer footer footer footer"`,
            }}>
                <Grid sx={{ gridArea: 'header', bgcolor: 'primary.main' }}>
                    <AppBar position="static">
                    <Button 
                        color="inherit" 
                        sx={{ marginLeft: 'auto' }} // Esto empuja el botón a la derecha
                    >
                        Inicio
                    </Button>
                        <Toolbar sx={{ backgroundColor: '#253260' }}>
                            <Box sx={{ display: 'flex', alignItems: 'center' }}>
                                <CardMedia
                                    component="img"
                                    image={logo}
                                    title="logo espol"
                                    sx={{ width: '130px' }}

                                />
                                <Box sx={{ display: 'flex', flexDirection: 'column', pl: 5 }}>
                                    <Typography variant="subtitle2" sx={{ fontWeight: 'bold' }}>
                                        Gestión

                                    </Typography>
                                    <Typography variant="subtitle2" sx={{ fontWeight: 'bold' }} >
                                        de Solicitudes

                                    </Typography>
                                </Box>


                            </Box>



                        </Toolbar>
                    </AppBar>
                </Grid>
                <Box sx={{
                    gridArea: 'main', display: 'flex',
                    alignItems: 'center',

                }}>

                    <Grid container direction="column" justifyContent="center" alignItems="center" >
                        <Grid item xs={12} sx={{ width: '70%', backgroundColor: "#fff", p: 2, boxShadow: 'rgba(149, 157, 165, 0.2) 0px 8px 24px;' }} >
                            <Grid item sx={{ m: { xs: 1, sm: 2 } }}>
                                <Divider sx={{ mb:3 }}>
                                    <AccountCircleIcon />
                                </Divider>
                                <Formik

                                    initialValues={initialValues}
                                    onSubmit={onSubmit}
                                    validationSchema={validationSchema}


                                >
                                    {(formik) => {
                                        return ( 
                                            <Form>
                                                <Grid container direction="column">
                                                    <Grid container spacing={2}>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Nombres"
                                                                name="nombres"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Apellidos"
                                                                name="apellidos"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                    </Grid>
                                                    <Grid container spacing={2}>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Cédula"
                                                                name="cedula"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                        
                                                    </Grid>
                                                    <Grid container spacing={2}>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Username"
                                                                name="username"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Correo Electrónico"
                                                                name="correo"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                    </Grid>
                                                    <Grid container spacing={2}>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Contraseña"
                                                                name="contrasena"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                        <Grid item xs={12} sm={6}>
                                                            <FormikControl
                                                                control="input"
                                                                type="text"
                                                                label="Confirmar contraseña"
                                                                name="confirmacion"
                                                                target="Forms"
                                                            />
                                                        </Grid>
                                                    </Grid>
                                                    <Grid container justifyContent="center">
                                                        <ButtonStyled variant="contained" type="submit"  sx={{ mt: 2 }} >
                                                            Registrar
                                                        </ButtonStyled>
                                                    </Grid>
                                                </Grid>
                                                
                                            </Form>
                                          
                                        );
                                    }}
                                </Formik>


                            </Grid>


                        </Grid>
                    </Grid>
                </Box>
                <Box sx={{
                    gridArea: 'right',
                    backgroundImage: `url(${banner})`,
                    backgroundSize: 'cover',
                    backgroundRepeat: 'no-repeat'

                }}>


                </Box>
                <Box sx={{ gridArea: 'footer' }}>
                    <Grid item xs={12}>
                        <Footer></Footer>
                    </Grid>
                </Box>

            </Box>

            <SnackbarComponent message={message} open={open} severity={severity} onClose={handleCloseSnackBar} />

        </>
    )
}

export default RegisterPage;
