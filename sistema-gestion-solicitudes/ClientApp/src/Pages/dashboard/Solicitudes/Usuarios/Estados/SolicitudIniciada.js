import { Box, Typography} from "@mui/material";
import { ButtonStyled, TypographyTitle, BtnCancel } from "../../../../../Utils/CustomStyles";
import FormikControl from "../../../../../components/Form/FormControl";
import { Formik, Form } from "formik";
import ConfirmDialog from "../../../../../components/Dialog/ConfirmDialog";
import { useState, useEffect } from "react";
import * as yup from "yup";
import MetodosFetch from "../../../../../Servicios/MetodosFetch";
import AnexosList from "../../Secciones/AnexosSection";
import DocumentsList from "../../Secciones/DocumentosSection";
import { API_URL } from "../../../../../Utils/Variables";
import MessageCard from "../../../../../components/Card/MessageCard";

const SolicitudIniciada = (props) => {
    const { solicitud, fetchData } = props;
    const [documentosAdicionales, setDocumentosAdicionales] = useState([]);
    const [openConfirmacion, setOpenConfirmacion] = useState(false);
    const [files, setFiles] = useState([]);


    const getDocumentacionByTipo = async () => {
        try {
            await fetch(API_URL + '/ArchivosBySolicitud/' + solicitud.solicitudDetalle.id)
                .then(response => response.json())
                .then(data => {
                    data.forEach(doc => {
                        let tipoArchivo = doc.tipoArchivo.nombre
                        if (tipoArchivo === 'DocumentacionAdicional') {
                            setDocumentosAdicionales(documentosAdicionales => [...documentosAdicionales, doc])
                        }

                    })
                })

        } catch (error) {
            console.error('Error fetching data:', error);
        }

    }

    useEffect(() => {
        getDocumentacionByTipo();
        return (() => {
            setDocumentosAdicionales([])

        })

    }, [])



    const onSubmit = (value) => {
        console.log(value)
        setOpenConfirmacion(true);

    }

    const initialValues = {
        files: [],
    }

    const handleEnviar = async () => {
        const formData = new FormData();
        console.log(files)
        for(let i = 0; i < files.length; i++) {
            let myfile=files[i]
            formData.append("files",myfile);
            // Agregar datos adicionales al FormData
            formData.append('Nombre', myfile.name);
            formData.append('SolicitudDetalleId', solicitud.solicitudDetalle.id); // Reemplaza con el valor real
            formData.append('Extension',  myfile.name.split('.').pop()); // Reemplaza con el valor real
            formData.append('UsuarioId', '4'); // Reemplaza con el valor real
            formData.append('TipoArchivoId', '1'); // Reemplaza con el valor real
            
        }

        


        // files.forEach((file) => {
        //     // Añadir el archivo al objeto FormData
        //     formData.append('File', file);
        //     // Añadir datos adicionales al objeto FormData
        //     formData.append('Nombre', file.name);
        //     formData.append('solicitudDetalleId', solicitud.solicitudDetalle.id);
        //     formData.append('Extension', file.name.split('.').pop());
        //     formData.append('UsuarioId', '4'); // Suponiendo que '4' es un valor fijo para el ejemplo
        //     formData.append('TipoArchivoId', '1'); // Suponiendo que '1' es un valor fijo para el ejemplo
        // });

        try{
            let response = await MetodosFetch.createArchivos(formData)
            console.log('response: ',response)
            if (response.ok) {
                setOpenConfirmacion(false);
                fetchData();
            }
            else {
                console.log('Error al subir los archivos');
            }
        }catch (error) {
            console.error('Error al enviar los archivos', error);
        }

    }

    const handleCloseConfirmacion = () => {
        setOpenConfirmacion(false);
    }


    const validationSchema = yup.object({
        files: yup
            .array()
            .min(1,'Seleccione un archivo para enviar')
            .required("Required")
    })



    return (
        <>
           
            <Box>
                <AnexosList anexos={solicitud.solicitudDetalle.anexos} estado={solicitud.estado.nombre} />
                
                {solicitud.solicitudDetalle.otrosArchivos &&
                    <>
                    <DocumentsList documentos={documentosAdicionales} title={'Documentación Adicional'} tipoArchivo={'DocumentacionAdicional'} />
                    <MessageCard message={solicitud.solicitudDetalle.archivosSolicitados}> </MessageCard>
                   
                    <Formik
                        onSubmit={onSubmit}
                        initialValues={initialValues}
                        validationSchema={validationSchema }
                    >
                        {(formik) => {
                            return (
                                <Form>
                                    <Box sx={{ display: "flex", flexDirection: "column" }}>

                                        <TypographyTitle>Subir documentación</TypographyTitle>
                                        <FormikControl
                                            control="file"
                                            type="file"
                                            label="Documentos"
                                            name="files"
                                            isMultiple={true}
                                            files={files}
                                            setFiles={setFiles}
                                        />

                                        <Box sx={{ display: "flex", justifyContent: "space-around", m: 2 }} >
                                            <ButtonStyled variant="contained" type="submit" >
                                                Enviar
                                            </ButtonStyled>
                                        </Box>
                                    </Box>



                                </Form>
                            );
                        }}
                    </Formik>

                    </>

                }
               
                <ConfirmDialog title={"Confirmación de Envio"} open={openConfirmacion} handleClose={handleCloseConfirmacion}>
                    <Typography variant="subtitle1">
                        Revisar que los anexos/documentos solicitados han sido correctamente completados.
                    </Typography>
                    <Typography variant="subtitle1">
                        Una vez listo haga click en continuar
                    </Typography>
                    <Box sx={{ display: "flex", justifyContent: "space-around", mt: 1 }} >
                        <ButtonStyled onClick={handleEnviar} variant="contained" sx={{ mt: 2 }}>Confirmar</ButtonStyled>
                        <BtnCancel onClick={handleCloseConfirmacion} variant="outlined" color="error" sx={{ mt: 2 }}>Cancelar</BtnCancel>

                    </Box>
                </ConfirmDialog>


            </Box>


        </>

    )

}
export default SolicitudIniciada;
