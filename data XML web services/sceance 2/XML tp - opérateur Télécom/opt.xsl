<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>opérateur Télécom</title>
            </head>
            <body>
                <h1>Clients</h1>
                <table border="1" cellpadding="5" cellspacing="0" >
                    <tr>
                        <th>Code</th>
                        <th>Nom</th>
                    </tr>
                    <xsl:for-each select="operateur/client">
                        <tr>
                            <td><xsl:value-of select="@code"/></td>
                            <td><xsl:value-of select="@nom"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <hr></hr>
                <h1>Abonnements</h1>
                <xsl:for-each select="operateur/client">
                    <h2>Client - <b><xsl:value-of select="@nom"/></b> :</h2>
                    <table border="1" cellpadding="5" cellspacing="0">
                        <tr>
                            <th>NUM Abonnement</th>
                            <th>NUM Facture</th>
                            <th>Date Facture</th>
                            <th>Montant</th>
                            <th>Reglee ?</th>
                        </tr>
                        <xsl:for-each select="abonnement/facture">
                            <tr>
                                <td><xsl:value-of select="../@num"/></td>
                                <td><xsl:value-of select="@numFact"/></td>
                                <td><xsl:value-of select="@dateFact"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                                <td><xsl:value-of select="@reglee"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>