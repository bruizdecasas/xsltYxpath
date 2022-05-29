<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="descripción" content="AE-3. XSLT y XPATH" />
        <title>Proeduca</title>
        <link rel="stylesheet" href="estilos.css" />
      </head>

      <body>
        <header>
          <h1>
            <a href="https://www.grupoproeduca.com/">
              <xsl:value-of select="ite/empresa" />
            </a>
          </h1>
          <h2>

            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="ite/@web" />
              </xsl:attribute>
              <xsl:value-of select="ite/@nombre" />
            </a>

          </h2>

        </header>

        <div class="ciclos">
         
          <table class="tabla2">
            <th colspan="4">CICLOS GRADO SUPERIOR</th>
            <tr>
              <th>
                ID
            </th>
              <th>
                NOMBRE
            </th>
              <th>
                GRADO
            </th>
              <th>
                DECRETO
            </th>
            </tr>
           
            <xsl:for-each select="ite/ciclos/ciclo">
              <tr>

                <td>
                  <xsl:value-of select="@id" />
                </td>
                <td>
                  <xsl:value-of select="nombre" />
                </td>
                <td>
                  <xsl:value-of select="grado" />
                </td>
                <td>
                 
                  <xsl:value-of select="decretoTitulo/@año" />
                </td>
              </tr>
            </xsl:for-each>


          </table>
        </div>

       
        <div class="profesores">
          <table class="tabla1">
            <th colspan="2">PROFESORES</th>
            <tr>
              <th>ID</th>
              <th>NOMBRE</th>
            </tr>
            <xsl:for-each select="ite/profesores/profesor">
              <tr>
                <td>
                  <xsl:value-of select="id" />
                </td>
                <td>
                  <xsl:value-of select="nombre" />
                </td>
              </tr>
            </xsl:for-each>

          </table>
        </div>


       
        <div class="listaenlaces">
         

          <div class="administracion">

        
            <ul class="lista1">
              <h3>
          ADMINISTRACIÓN INSTITUTO
           </h3>
              <ul>
               
                <h4> DIRECCION</h4>
                
                <li>
                  Nombre:
                  <xsl:value-of select="ite/director/nombre" />
                </li>
                <li>
                  Despacho:
                  <xsl:value-of select="ite/director/despacho" />
                </li>
              </ul>
              <ul>
                
                <h4>JEFATURA DE ESTUDIOS</h4>

                <li>
                  Nombre:
                  <xsl:value-of select="ite/jefe_estudios/nombre" />
                </li>
                <li>
                  Despacho:
                  <xsl:value-of select="ite/jefe_estudios/despacho" />
                </li>
              </ul>


            </ul>

          </div>


          <div class="enlaces">

            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="ite/@web" />
              </xsl:attribute>

              <img src="Imagenes\descarga.png" alt="" />
            </a>

            <br />

          </div>

        </div>


      
        <div class="formulario">
          
          <form action="procesarformulario.jsp" method="get">
           
            <legend>Solicitud de información</legend>
           
            <fieldset>
             
              <label for="nombre">Nombre: </label>
              <input type="text" name="nombre" id="nombre" autofocus="yes" />
              <br />
              <label for="apellidos">Apellidos: </label>
              <input type="text" id="apellidos" name="apellidos"/>
              <br />

              <label for="ciclo"> Información sobre el ciclo </label>
              <br />
              <select name="ciclo">
                <xsl:for-each select="ite/ciclos/ciclo">
                  <option>
                    <xsl:value-of select="nombre" />
                  </option>
                </xsl:for-each>
              </select>
              <br />

             
              <label for="Tipo curso">Tipo curso</label>
              <br />

              <input type="radio" name="puntos" value="0" />
              Online
              <br />
              <input type="radio" name="puntos" value="1" />
              Presencial
              <br />
              <label for="comentarios">Comentarios</label>
              <br />

              <textarea name="comentarios" id="comenta" cols="50" rows="6"></textarea>

              <br />
              <input type="submit" value="Enviar solicitud" />

              <input type="reset" value="Borrar datos" />
            </fieldset>
          </form>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>