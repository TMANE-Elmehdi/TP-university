<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Biblio</title>
            </head>
            <body>
                <h1>Bibliotheque</h1>
                <xsl:for-each select="biblio/etudiant">
                    <ul>
                        <li>Code:<xsl:value-of select="@code"/></li>
                        <li>Nom:<xsl:value-of select="@nom"/></li>
                        <li>Prenom:<xsl:value-of select="@prenom"/></li>
                        <li>Age:<xsl:value-of select="@age"/></li>
                    </ul>
                    <table border="1" cellpadding="0" cellspacing="0" width="90%">
                        <tr>
                            <th>ID</th>
                            <th>Titre</th>
                            <th>DatePret</th>
                            <th>Rendu</th>
                        </tr>
                        <xsl:for-each select="livre">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="@titre"/></td>
                                <td><xsl:value-of select="@datepret"/></td>
                                <td><xsl:value-of select="@rendu"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="3">Nombre des livres redus:</td>
                            <td><xsl:value-of select="count(livre[@rendu='oui'])"/></td>
                        </tr>
                        <tr>
                            <td colspan="3">Nombre des livres non redus:</td>
                            <td><xsl:value-of select="count(livre[@rendu='non'])"/></td>
                        </tr>
                    </table>
               </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>