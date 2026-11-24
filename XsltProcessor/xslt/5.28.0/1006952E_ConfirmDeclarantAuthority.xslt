<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cda="urn:customs.ru:Information:CustomsAuditDocuments:ConfirmDeclarantAuthority:5.28.0">
	<!-- Шаблон для типа ConfirmDeclarantAuthorityType -->
	<xsl:template match="cda:ConfirmDeclarantAuthority">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }
                  
                  .val
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="right" class="title">
									<b>
										<xsl:apply-templates select="cda:Customs"/>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Запрос о подтверждении полномочий декларанта</b>
										<br/>
										<xsl:text>№ </xsl:text>
										<xsl:apply-templates select="cda:RequestNumber"/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="width: 100%; text-align: justify;">
						<xsl:text>Уважаемый(-ая) </xsl:text>
						<span class="val" style="border-bottom: 1px solid black;">
							<xsl:apply-templates select="cda:Declarant"/>
						</span>
						<xsl:text>, </xsl:text>
						<xsl:text> просим подтвердить подавалась ли от Вашего имени пассажирская таможенная декларация на транспортное средство для личного пользования </xsl:text>
						<span class="val" style="border-bottom: 1px solid black;">
							<xsl:apply-templates select="cda:VehicleDetails"/>
						</span>
						<xsl:text>.</xsl:text>
					</div>
					<br/>
					<br/>
					<br/>
					<table width="100%" style="font-size: 10pt;">
						<tbody>
							<tr valign="bottom">
								<td width="40%">
									<xsl:text>Уполномоченное должностное лицо</xsl:text>
									<br/>
									<xsl:text>таможенного органа</xsl:text>
								</td>
								<td width="45%" align="center" class="val">
									<xsl:apply-templates select="cda:CustomsPerson/cat_ru:PersonName"/>
								</td>
								<td width="15%" align="center" class="val">
									<xsl:apply-templates select="cda:CustomsPerson/cat_ru:LNP"/>
									<xsl:if test="cda:CustomsPerson/cat_ru:CustomsCode">
										<br/>
										(<xsl:apply-templates select="cda:CustomsPerson/cat_ru:CustomsCode"/>)
									</xsl:if>
								</td>
							</tr>
							<tr align="center">
								<td width="30%"></td>
								<td width="50%" style="font-size:8pt;">(Ф.И.О)</td>
								<td width="20%" style="font-size:8pt;">(ЛНП)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="cda:Customs">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="cda:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cda:DeclarantType -->
	<xsl:template match="cda:Declarant">
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="cda:PersonINN">
			<xsl:text>, ИНН </xsl:text>
			<xsl:apply-templates select="cda:PersonINN"/>
		</xsl:if>
		<xsl:if test="cda:PersonIdCard">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="cda:PersonIdCard"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="cda:PersonIdCard">
		<xsl:choose>
			<xsl:when test="RUScat_ru:FullIdentityCardName">
				<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:text>, выдан </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cda:GTDID8Type -->
	<xsl:template match="cda:RequestNumber">
		<xsl:apply-templates select="cda:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cda:RegistrationDate" mode="num_date"/>
		<xsl:text>/П</xsl:text>
		<xsl:apply-templates select="cda:SerialNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cda:VehicleDetailsType -->
	<xsl:template match="cda:VehicleDetails">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:variable name="ln" select="local-name()"/>
			<xsl:choose>
				<xsl:when test="$ln = 'VINID'">VIN </xsl:when>
				<xsl:when test="$ln = 'ChassisID'">шасси (рама) </xsl:when>
				<xsl:when test="$ln = 'BodyID'">кабина (кузов) </xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ConfirmDeclarantAuthority']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
