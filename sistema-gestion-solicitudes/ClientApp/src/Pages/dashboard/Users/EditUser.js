import React from "react";
import { Formik, Form } from "formik";
import * as yup from "yup";
import { BtnCancel, ButtonStyled, SwitchStyled } from "../../../Utils/CustomStyles";
import { Box, Typography,Grid } from "@mui/material"
import FormikControl from "../../../components/Form/FormControl";
import { useState } from 'react';
import { API_URL } from "../../../Utils/Variables";
import FormDialog from "../../../components/Dialog/Dialogo";

const EditUser = ({ open, handleClose, handleSnackBar,data }) => {
    const [toggle, setToggle] = useState(true);

    
    const initialValues = {
        id: data?.id,
        nombres: data?.nombres,
        apellidos: data?.apellidos,
        correo: data?.correo,
        username:data?.username,
        cedula: data?.cedula,
        roles: [],
        selectedEspecialidades: [],
        selectedRoles: [],
        
    };

    const  onSubmit = async (values) => {
        console.log('go to update user')
        const data = JSON.stringify({
            id: values.id || 'vacio',
            nombres: values.nombres,
            apellidos: values.apellidos,
            correo: values.correo,
            username: values.username,
            cedula: values.cedula
        })

        console.log('data: ',data)
        //handleSnackBar(true, "Usuario editado exitosamente");
        let res = await fetch(API_URL + `/User/${values.id}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: data,
        })
        if (res.status === 200) {
            handleSnackBar(true, "Usuario editado exitosamente");
            
        }
        else {
            handleSnackBar(false,"Error al editar usuario");
            console.log(res.status)

            res.json().then((value)=>{
                console.log('value: ',value)
            })
        }

    }

    const validationSchema = yup.object({
        nombre: yup
            .string()
            .min(3, "Ingrese más de 3 caracteres")
            .required("Campo requerido"),
        maxUsers: yup
            .number()
            .positive('Ingrese un numero positivo')
            .required("Campo requerido"),

    });

    const handleToggle = () => {
        setToggle(!toggle);
    
        
    };

    const handleResetForm = () => {
        //setSelectedEspecialidades([])
        //setSelectedRoles([])
        handleClose();
    }

    return (
        <>
            <FormDialog title={"Editar Usuario"} open={open} handleClose={handleClose}>

                <Formik
                initialValues={initialValues}
                onSubmit={onSubmit}
                //validationSchema={validationSchema}
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
                            </Grid>
                            <Grid container direction="column">
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
                                            type="email"
                                            label="Correo Electronico"
                                            name="correo"
                                            target="Forms"
                                        />
                                    </Grid>
                                </Grid>
                            </Grid>
                            <Grid container direction="column">
                                <Grid container spacing={2}>
                                    <Grid item xs={12} sm={6}>
                                        <FormikControl
                                            control="input"
                                            type="text"
                                            label="Cedula de Identidad"
                                            name="cedula"
                                            target="Forms"
                                        />
                                    </Grid>
                               
                                </Grid>
                            </Grid>

                            <Grid container direction="column">
                                <Grid container spacing={2}>
                                    <Grid item xs={12} sm={6}>
                                        <Typography> Estado  </Typography>
                                        <SwitchStyled
                                            name="Estado"
                                            onChange={handleToggle}
                                            checked={toggle}

                                        />
                                    </Grid>
                              
                                </Grid>
                            </Grid>

                            <Grid container justifyContent="space-around">
                                <ButtonStyled variant="contained" type="submit" sx={{ mt: 2 }} >
                                    Actualizar
                                </ButtonStyled>
                                <BtnCancel variant="outlined" color="error" type="button" sx={{ mt: 2 }} onClick={handleResetForm} >
                                    Cancelar
                                </BtnCancel>
                            </Grid>



                        </Form>
                    );
                }}
                </Formik>
            </FormDialog>
        </>
    );
};
export default EditUser;