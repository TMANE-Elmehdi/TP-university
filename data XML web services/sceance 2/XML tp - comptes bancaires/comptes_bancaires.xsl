<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevés de comptes bancaires.</title>
            </head>
            <body>
                <h1>Releves Question 4</h1>
                <xsl:for-each select="releve">
                    <h2>RIB : "<xsl:value-of select="@RIB"/>"</h2>
                    <ul>
                        <li>Date de Releve : <xsl:value-of select="dateReleve"/></li>
                        <li>Solde : <xsl:value-of select="solde"/></li>
                    </ul>
                    <xsl:for-each select="operations">
                        <h3>Les operations de "<xsl:value-of select="@dateDebut"/>" á "<xsl:value-of select="@dateFin"/>"</h3>
                        <table border="1" cellpadding="5" cellspacing="0">
                            <tr>
                                <th rowspan="{count(operations/operation)}">OPERATION</th>
                                <th>Type</th>
                                <th>Date</th>
                                <th>Montant</th>
                                <th>Description</th>    
                            </tr>
                            <xsl:for-each select="operation">
                                <tr>
                                    <td><xsl:value-of select="@type"/></td>
                                    <td><xsl:value-of select="@date"/></td>
                                    <td><xsl:value-of select="@montant"/></td>
                                    <td><xsl:value-of select="@description"/></td>
                                </tr>
                            </xsl:for-each>
                            <tr>
                                <td>Total des opérations de débit</td>
                                <td><xsl:value-of select="count(operation[@type='DEBIT'])"/></td>
                                <td>Total des opérations de crédit</td>
                                <td><xsl:value-of select="count(operation[@type='CREDIT'])"/></td>
                            </tr>
                        </table>
                    </xsl:for-each>
                    <hr></hr>
                    <h1>Releves Question 5</h1>
                    <table border="1" cellpadding="5" cellspacing="0">
                        <tr>
                            <th rowspan="{count(operation[@type='CREDIT'])}">OPERATION</th>
                            <th>Type</th>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Description</th>    
                        </tr>
                        <xsl:for-each select="operations/operation[@type='CREDIT']">
                            <tr>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                                <td><xsl:value-of select="@description"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>