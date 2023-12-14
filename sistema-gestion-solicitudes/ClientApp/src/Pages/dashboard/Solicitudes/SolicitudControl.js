import {useParams } from 'react-router-dom';
import SolicitudComponent from './Usuarios/Solicitud';
import SolicitudCEI from './CEI/SolicitudCEI';





const SolicitudControl = () => {

    const params = useParams();
    const rol = {'rol1': 'solicitante','rol2': 'presidente'};
    
    return (

        <>

            {rol['rol2'] === 'solicitante' ?
                
                    <SolicitudComponent/>
              
                :
               
                    <SolicitudCEI/>
                

        
            }

            



        </>

    )

}
export default SolicitudControl;

