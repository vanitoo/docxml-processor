<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ElS="urn:customs.ru:includes:ElSign:5.27.0">
	<xsl:template match="*" mode="DOStamp">
		<xsl:param name="top" select="'21'"/>
		<xsl:param name="left" select="'210'"/>
		<xsl:variable name="stampData" select="."/>
		<div style="border: 0px; width: 380px; position: absolute; top:{$top}mm; left:{$left}mm;">
			<div width="100%" style="text-indent:3em; text-align: left; padding-top: 3px; font-family: Arial; font-size: 8pt; font-weight: bold; color: black;">
				<xsl:text>Регистр.№ в таможне: </xsl:text>
				<xsl:value-of select="$stampData/*[local-name() = 'RegisterNumberReport']/*[local-name() = 'CustomsCode']"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring($stampData/*[local-name() = 'RegisterNumberReport']/*[local-name() = 'RegistrationDate'], 9, 2)"/>
				<xsl:value-of select="substring($stampData/*[local-name() = 'RegisterNumberReport']/*[local-name() = 'RegistrationDate'], 6, 2)"/>
				<xsl:value-of select="substring($stampData/*[local-name() = 'RegisterNumberReport']/*[local-name() = 'RegistrationDate'], 3, 2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$stampData/*[local-name() = 'RegisterNumberReport']/*[local-name() = 'GTDNumber']"/>
			</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<!--td>
						<p> </p>
					</td-->
					<td width="380" style="width: 380; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding: 2px; float: right; margin-left:2px; margin-bottom:2px; color: magenta; border: 2px magenta solid; -moz-border-radius: 5px; -webkit-border-radius: 5px; -khtml-border-radius:15px; border-radius: 5px;">
						<div style="border: 0px;">
							<table>
								<tbody>
									<tr valign="bottom">
										<td width="30%" style="font-family: Arial; font-size: 8pt; text-align:right; color: magenta;">Отчетность принял:</td>
										<td width="70%" style="border-bottom: 1px solid magenta; font-family: Arial;font-size: 8pt;color: magenta;text-align:right;word-break: normal; overflow-wrap: break-word; word-wrap: break-word;">
											<xsl:value-of select="$stampData/*[local-name() = 'CustomInspector']/*[local-name() = 'PersonSurname']"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="concat(substring($stampData/*[local-name() = 'CustomInspector']/*[local-name() = 'PersonName'], 1, 1), '.')"/>
											<xsl:if test="$stampData/*[local-name() = 'CustomInspector']/*[local-name() = 'PersonMiddleName']">
												<xsl:value-of select="concat(substring($stampData/*[local-name() = 'CustomInspector']/*[local-name() = 'PersonMiddleName'], 1, 1), '.')"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td/>
										<td colspan="2" style="padding-top: 3px;padding-bottom: 3px; font-family: Arial; font-size: 6pt; color:magenta;font-weight: bold;text-align:center;vertical-align:middle;">(фамилия, имя, отчество должностного лица)</td>
									</tr>
									<tr valign="bottom">
										<td style="font-family: Arial; font-size: 8pt; text-align:right;color:magenta;">Дата и время:</td>
										<td colspan="2" style="font-family: Arial; font-size: 8pt; color: magenta;">
											<xsl:call-template name="signatureDateTime"><xsl:with-param name="dateIn" select="$stampData/*[local-name() = 'RegDate']"/></xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring($stampData/*[local-name() = 'RegTime'], 1, 5)"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	
	</xsl:template>
	<xsl:template match="*" mode="Signature">
		<xsl:param name="width" select="400"/>
		<xsl:param name="firstCol" select="1"/>
		<div style="clear: both;border: 0px;"> <br/>
		</div>
		<div style="border: 0px;">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<xsl:if test="$firstCol = 1">
						<td>
							<p> </p>
						</td>
					</xsl:if>
					<td width="{$width}" style="width: {$width}; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; padding: 10px; float: right; margin-left:3px; margin-bottom:3px; color: rgb(0,102,255); border: 6px rgb(0,102,255) solid; -moz-border-radius: 15px; -webkit-border-radius: 15px; -khtml-border-radius:15px; border-radius: 15px;">
						<div style="border: 0px;">
							<table>
								<tbody>
									<tr>
										<td width="4%"/>
										<td width="92%" colspan="2" style="padding-top: 3px;font-family: Arial;font-size: 10pt;font-weight: bold;color: rgb(0,102,255);text-align:center;vertical-align:middle;word-break: normal; overflow-wrap: break-word; word-wrap: break-word;">ДОКУМЕНТ ПОДПИСАН ЭЛЕКТРОННОЙ ПОДПИСЬЮ</td>
										<td width="4%"/>
									</tr>
									<tr>
										<td/>
										<td colspan="2" style="padding-top: 3px;padding-bottom: 3px; font-family: Arial; font-size: 7pt; background:rgb(0,102,255); color:#ffffff;font-weight: bold;text-align:center;vertical-align:middle;">СВЕДЕНИЯ О СЕРТИФИКАТЕ ЭП</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td colspan="2" style="padding-top: 3px;font-family: Arial; font-size: 7pt; color: rgb(0,102,255); font-weight: bold;">
											<xsl:text>Сертификат: </xsl:text>
											<xsl:value-of select="@id"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td colspan="2" style="font-family: Arial; font-size: 7pt; color: rgb(0,102,255); font-weight: bold;">
											<xsl:text>Владелец: </xsl:text>
											<xsl:value-of select="@owner"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td colspan="2" style="padding-bottom: 3px;font-family: Arial; font-size: 7pt; color: rgb(0,102,255); font-weight: bold;">
											<xsl:text>Действителен: с </xsl:text>
											<xsl:call-template name="signatureDateTime"><xsl:with-param name="dateIn" select="@from"/></xsl:call-template>
											<xsl:text> по </xsl:text>
											<xsl:call-template name="signatureDateTime"><xsl:with-param name="dateIn" select="@to"/></xsl:call-template>
										</td>
										<td/>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="signatureDateTime">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring($dateIn, 9, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 1, 4)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateIn, 12, 8)"/>
	</xsl:template>
</xsl:stylesheet>
