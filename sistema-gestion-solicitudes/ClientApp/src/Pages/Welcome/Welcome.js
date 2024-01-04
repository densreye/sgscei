import {
    Grid, Box, AppBar, Toolbar, 
    CardContent, Typography, CardMedia
} from "@mui/material"
import { Link , Outlet} from "react-router-dom";
import { authUrl } from "../../Utils/Variables"
import Footer from "../../components/Footer/Footer";
import { ButtonStyled, CardLogin, TypographyTitle } from "../../Utils/CustomStyles";
import logo from "../../assets/logo.png";
import background from "../../assets/background.jpg";


const LoginPage = () => { 

        


        return (

            <>
                <Box sx={{
                    display: 'grid',
                    height: '100vh',
                    gridTemplateRows: 'auto 85% 15%',
                    gridTemplateAreas: `"header header header header"
                                          "main main main main"
                                          "footer footer footer footer"`,
                } }>


                    <Grid sx={{ gridArea: 'header', bgcolor: 'primary.main' }}>
                        <AppBar position="static">
                            <Toolbar sx={{ backgroundColor: '#253260' }}>
                                <Box sx={{ display: 'flex', alignItems:'center' }}>
                                    <CardMedia
                                        component="img"
                                        image={logo}
                                        title="logo espol"
                                        sx={{ width: '130px' }}

                                    />
                                    <Box sx={{ display: 'flex' , flexDirection:'column', pl:5}}>
                                        <Typography variant="h6" sx={{ fontWeight: 'bold' }}>
                                            Comité de Ética en Investigación
                                        </Typography>
                                    </Box>
                                    

                                </Box>
                                


                            </Toolbar>
                        </AppBar>
                    </Grid>
                    <Box sx={{
                        gridArea: 'main', display: 'flex',
                        alignItems: 'center', backgroundImage: `url(${background})`,
                        backgroundPosition: 'center',
                        backgroundSize: 'cover',
                        backgroundRepeat: 'no-repeat'
                    }}>
                        <Grid container spacing={15} sx={{p:25}}>
                            <Grid item xs={11} md={6}>
                                <CardLogin >
                                    <CardContent>
                                        <TypographyTitle >
                                            Usuario Espol

                                        </TypographyTitle>
                                        <ButtonStyled variant="contained" component={Link} to={authUrl}>
                                            Continuar
                                        </ButtonStyled>
                                    </CardContent>
                                </CardLogin>
                            </Grid>
                            <Grid item xs={11} md={6}>
                                <CardLogin>
                                    <CardContent>
                                        <TypographyTitle  >
                                            Usuario Externo
                                        </TypographyTitle>
                                        <ButtonStyled variant="contained" component={Link} to="/LoginExt">
                                            Continuar
                                        </ButtonStyled>
                                    </CardContent>
                                </CardLogin>

                            </Grid>      
                        </Grid>
                        <Outlet />
                    </Box>
                    <Box sx={{ gridArea: 'footer' }}>
                        <Grid item xs={12}>
                            <Footer></Footer>
                        </Grid>
                    </Box>
                        
                </Box>
       
               

            </>
        )
    }

export default LoginPage;
