<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:ecd_rc="urn:customs.ru:Information:CustomsDocuments:ECD_RegistryCertificate:5.28.0">
	<!-- Шаблон для типа ECD_RegistryCertificateType -->
	<xsl:template match="ecd_rc:ECD_RegistryCertificate">
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
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
									<br/>
									<br/>
									<b>
										<xsl:text>СВИДЕТЕЛЬСТВО № </xsl:text>
										<xsl:apply-templates select="ecd_rc:CertificateNumber"/>
										<br/>
										<xsl:text>о включении в реестр операторов электронной торговли</xsl:text>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<div>Выдано</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="ecd_rc:EC_Operator"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование оператора электронной торговли, содержащее указание на его организационно-правовую форму и место нахождения, идентификационный номер налогоплательщика)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>Предназначение склада электронной торговли</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="ecd_rc:WHPurpose">
										<xsl:if test="position() != 1"><xsl:text> / </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(временное хранение товаров электронной торговли / хранение товаров электронной торговли, помещенных под таможенную процедуру таможенного склада)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>Место нахождения склада электронной торговли</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="ecd_rc:WHPurposeAddress" mode="address"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr"/>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>Полезный объем и (или) полезная площадь склада электронной торговли</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="*[contains(local-name(), 'WHUs')]">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:choose>
											<xsl:when test="local-name() = 'WHUsefulVolume'">Объем: </xsl:when>
											<xsl:when test="local-name() = 'WHUsableArea'">Площадь: </xsl:when>
										</xsl:choose>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr"/>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:apply-templates select="ecd_rc:CustomsPerson"/>
					<br/>
					<br/>
					<div style="width: 100%; text-align: right;">
						<xsl:text>Дата выдачи настоящего свидетельства </xsl:text>
						<span style="display: inline-block; width: 30mm; text-align: center;" class="value">
							<xsl:apply-templates select="ecd_rc:DateOfIssue" mode="russian_date"/>
						</span>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="ecd_rc:CustomsPerson">
		<table>
			<tbody>
				<tr valign="bottom">
					<td width="30%">Руководитель ФТС России <br/>(лицо, его замещающее или лицо, им уполномоченное)<br/><xsl:apply-templates select="*[local-name() = 'PersonPost']"/></td>
					<td width="20%" class="value"></td>
					<td width="50%" align="center" class="value">
						<xsl:apply-templates select="." mode="IOFamily"/>
					</td>
				</tr>
				<tr>
					<td class="descr"></td>
					<td class="descr">(подпись)</td>
					<td class="descr">(фамили, имя, отчество (при наличии))</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="IOFamily">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(*[local-name() = 'PersonName'], 1, 1)"/>
			<xsl:text>.</xsl:text>
			<xsl:if test="*[local-name() = 'PersonMiddleName']">
				<xsl:value-of select="substring(*[local-name() = 'PersonMiddleName'], 1, 1)"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="*[local-name() = 'PersonSurname']"/>
		</element>
	</xsl:template>
	
	<xsl:template match="ecd_rc:WHPurpose">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">временное хранение товаров электронной торговли</xsl:when>
				<xsl:when test=". = 2">хранение товаров электронной торговли, помещенных под таможенную процедуру таможенного склада</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="ecd_rc:EC_Operator">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text>, место нахождения: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text>, ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="splitComma">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitSpace">
		<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitCR">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']" mode="splitComma"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="ecd_rc:CertificateNumber">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
		<xsl:if test="*[4]">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[4]"/>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='ECD_RegistryCertificate']//*" priority="-1">
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
