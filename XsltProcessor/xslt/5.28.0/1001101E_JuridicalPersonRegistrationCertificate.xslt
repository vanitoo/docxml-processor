<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="jprc cltReg_ru clt_ru cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cltReg_ru="urn:customs.ru:Information:RegistrationDocuments:RegistrationCommonLeafTypes:4.8.1" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:jprc="urn:customs.ru:Information:RegistrationDocuments:JuridicalPersonRegistrationCertificate:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='JuridicalPersonRegistrationCertificate']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="IssueOrRegistrationDate">
		<xsl:param name="base"/>
		<xsl:param name="text"/>
		<xsl:variable name="xpath_base">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$base"/>
			</xsl:call-template>
		</xsl:variable>
		<table align="center" width="100%">
			<tr>
				<td width="20%" align="center" class="graph">
					<element xml_node="{$xpath_base}">
						<xsl:text>"</xsl:text>
						<u>
							<xsl:value-of select="substring($base,9,2)"/>
						</u>
						<xsl:text>"</xsl:text>
					</element>
				</td>
				<td class="graph" width="5%"/>
				<td align="center" class="graph" width="40%">
					<element xml_node="{$xpath_base}">
						<xsl:text>"</xsl:text>
						<u>
							<xsl:call-template name="MonthName">
								<xsl:with-param name="month" select="substring($base,6,2)"/>
							</xsl:call-template>
						</u>
						<xsl:text>"</xsl:text>
					</element>
				</td>
				<td class="graph" width="5%"/>
				<td align="center" class="graph" width="30%">
					<element xml_node="{$xpath_base}">
						<xsl:text>"</xsl:text>
						<u>
							<xsl:value-of select="substring($base,1,4)"/>
						</u>
						<xsl:text>"</xsl:text>
					</element>
				</td>
			</tr>
			<tr class="bordered">
				<td align="center" class="graph">(число)</td>
				<td/>
				<td align="center" class="graph">(месяц (прописью)</td>
				<td/>
				<td align="center" class="graph">(год)</td>
			</tr>
		</table>
	</xsl:template>
	<!--Месяц прописью-->
	<xsl:template name="MonthName">
		<xsl:param name="month"/>
		<xsl:choose>
			<xsl:when test="$month = '01'">января</xsl:when>
			<xsl:when test="$month = '02'">февраля</xsl:when>
			<xsl:when test="$month = '03'">марта</xsl:when>
			<xsl:when test="$month = '04'">апреля</xsl:when>
			<xsl:when test="$month = '05'">мая</xsl:when>
			<xsl:when test="$month = '06'">июня</xsl:when>
			<xsl:when test="$month = '07'">июля</xsl:when>
			<xsl:when test="$month = '08'">августа</xsl:when>
			<xsl:when test="$month = '09'">сентября</xsl:when>
			<xsl:when test="$month = '10'">октября</xsl:when>
			<xsl:when test="$month = '11'">ноября</xsl:when>
			<xsl:when test="$month = '12'">декабря</xsl:when>
			<xsl:otherwise>-ОШИБКА-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jprc:JuridicalPersonRegistrationCertificate">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>СВИДЕТЕЛЬСТВО О ГОСУДАРСТВЕННОЙ РЕГИСТРАЦИИ ЮРИДИЧЕСКОГО ЛИЦА по форме P51001 / Лист записи ЕГРЮЛ</title>
				<style type="text/css">
					body {	text-align: center; background: #cccccc; font-family: Arial }
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Arial; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Arial; color: windowtext; }
					div.page { width: 210mm; height: 297mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 10pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
			</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="right" class="value" width="100%">
								<xsl:variable name="xpath_FormName">
									<xsl:call-template name="get_xpath">
										<xsl:with-param name="node" select="jprc:FormName"/>
									</xsl:call-template>
								</xsl:variable>
								<element xml_node="{$xpath_FormName}">
							Форма No. │<xsl:value-of select="substring(jprc:FormName,1,1)"/>│<xsl:value-of select="substring(jprc:FormName,2,1)"/>│<xsl:value-of select="substring(jprc:FormName,3,1)"/>│<xsl:value-of select="substring(jprc:FormName,4,1)"/>│<xsl:value-of select="substring(jprc:FormName,5,1)"/>│<xsl:value-of select="substring(jprc:FormName,6,1)"/>│
						</element>
							</td>
						</tr>
					</table>
					<p/>
					СВИДЕТЕЛЬСТВО<br/>
				   О ГОСУДАРСТВЕННОЙ РЕГИСТРАЦИИ ЮРИДИЧЕСКОГО ЛИЦА<br/>
				    по форме P51001 / Лист записи ЕГРЮЛ
					<p/>
					<p align="left">
						<span class="value">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						Настоящим   подтверждается,   что   в соответствии  с Федеральным законом  "О  государственной  регистрации  юридических  лиц"  в Единый государственный реестр юридических лиц внесена запись о создании
						</span>
					</p>
					<table>
						<tr>
							<td class="border-bottom">
								<span class="value">
									<xsl:apply-templates select="jprc:JuridicalPersonLongTitle"/>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top" width="100%">(полное наименование юридического лица с указанием<br/>
						  организационно - правовой формы)
						</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="border-bottom">
								<span class="value">
									<xsl:apply-templates select="jprc:JuridicalPersonShortcut"/>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top" width="100%">(сокращенное наименование юридического лица)</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="border-bottom">
								<span class="value">
									<xsl:apply-templates select="jprc:JuridicalPersonFirmName"/>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top" width="100%">(фирменное наименование)</td>
						</tr>
					</table>
					<table>
						<tr>
							<td width="50%">
								<xsl:call-template name="IssueOrRegistrationDate">
									<xsl:with-param name="base" select="jprc:RegistrationDate"/>
								</xsl:call-template>
							</td>
							<td class="value" width="50%">за   основным  государственным регистрационным номером
							</td>
						</tr>
					</table>
					<p/>
					<xsl:apply-templates select="jprc:RegistrationNumberID"/>
					<p/>
					<table>
						<tr>
							<td align="center" class="border-bottom">
								<span class="value">
									<xsl:apply-templates select="jprc:RegistrationOrganization"/>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top" width="100%">(наименование регистрирующего органа)</td>
						</tr>
					</table>
					<p/>
					<table>
						<tr>
							<td class="value" width="50%">
							Должность уполномоченного<br/>
							лица регистрирующего органа<br/>
								<xsl:apply-templates select="jprc:RegisteringClerkSignature/cat_ru:PersonPost"/>
							</td>
							<td align="center" class="value" width="50%">
								<br/>
								<br/>
								<xsl:apply-templates select="jprc:RegisteringClerkSignature/cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="jprc:RegisteringClerkSignature/cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="jprc:RegisteringClerkSignature/cat_ru:PersonMiddleName"/>
							</td>
						</tr>
						<tr>
							<td class="value" width="50%"/>
							<td align="center" class="border-top" width="50%">(подпись, Ф.И.О.)
						</td>
						</tr>
					</table>
					<p>
						<br/>
						<br/>
						<br/>
						<br/>
					</p>
					<p align="right">  М.П. <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					</p>
					<xsl:if test="jprc:Form">
						<br/>
						<p align="right">серия
						<xsl:apply-templates select="jprc:Form/jprc:FormSerial"/> № 
						<xsl:apply-templates select="jprc:Form/jprc:FormNumber"/>
						</p>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
