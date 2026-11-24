<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:csdo="urn:EEC:M:CA:SimpleDataObjects:v1.10.0" 
	xmlns:ccdo="urn:EEC:M:CA:ComplexDataObjects:v1.10.0" 
	xmlns:casdo="urn:EEC:M:CA:SimpleDataObjects:v1.10.0" 
	xmlns:cacdo="urn:EEC:M:CA:ComplexDataObjects:v1.10.0" 
	xmlns:rcc="urn:EEC:R:051:CustomsControlUnifiedDoc:v1.0.0">
	<!-- Шаблон для типа CustomsControlUnifiedDocType -->
	<xsl:template match="rcc:CustomsControlUnifiedDoc">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Сведения из документов, оформленных по результатам проведения таможенного контроля в отношении товаров и транспортных средств международной перевозки</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время создания электронного документа (сведений)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="csdo:EDocDateTime"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Признак электронного документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="casdo:EDocIndicatorCode"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">кодовое обозначение таможенного органа, зарегистрировавшего таможенный документ, оформленный по результатам проведения таможенного контроля</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Кодовое обозначение вида документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="csdo:DocKindCode"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Регистрационный номер таможенного документа, оформленного по результатам проведения таможенного контроля</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cacdo:InspectionDocIdDetails"/>
							</td>
						</tr>
					</table>
					
					<xsl:if test="csdo:FormSeriesId">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Обозначение серии бланков документов, присвоенное при изготовлении</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="csdo:FormSeriesId"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="casdo:CustomsControlFormCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Кодовое обозначение формы таможенного контроля</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="casdo:CustomsControlFormCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="casdo:PlaceName">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование места составления документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="casdo:PlaceName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">дата заполнения таможенного документа, оформленного по результатам проведения таможенного контроля</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="csdo:DocCreationDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="csdo:StartDateTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">дата и время начала проведения таможенного досмотра (таможенного осмотра)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="csdo:StartDateTime"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="csdo:EndDateTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">дата и время окончания проведения таможенного досмотра (таможенного осмотра)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="csdo:EndDateTime"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">сведения о должностном лице таможенного органа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:for-each select="cacdo:ATDCustomsPersonDetails">
									<xsl:if test="position()!=1"><br/><br/></xsl:if>
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<xsl:if test="cacdo:ATDPersonDetails">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">сведения о лице, присутствующем при (участвующем в) проведении таможенного контроля или совершении иных действий в отношении объектов таможенного контроля</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="cacdo:ATDPersonDetails">
										<xsl:if test="position()!=1"><br/><br/></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					
					<xsl:if test="cacdo:OwnerAbsenceDetails">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">сведения о случае (причине) проведения таможенного контроля или совершения иных действий в отношении объектов таможенного контроля в отсутствие лица, обладающего полномочиями в отношении товаров</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cacdo:OwnerAbsenceDetails"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cacdo:ATDInformationDetails">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ccdo:CommunicationDetails">
		<xsl:if test="position() != 1">; </xsl:if>
		<xsl:apply-templates select="csdo:CommunicationChannelCode"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="csdo:CommunicationChannelName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="csdo:CommunicationChannelId"/>
	</xsl:template>
	<xsl:template match="csdo:CommunicationChannelId">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="cacdo:OwnerAbsenceDetails">
		<xsl:apply-templates select="csdo:DescriptionText"/>
		<xsl:if test="casdo:OwnerAbsenceCode">
			<br/><br/>
			<xsl:text>Коды: </xsl:text>
			<xsl:for-each select="casdo:OwnerAbsenceCode">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cacdo:ATDPersonDetails">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ccdo:SubjectAddressDetails">
		<xsl:text>адрес: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:text>;</xsl:text>
	</xsl:template>
	<xsl:template match="ccdo:IdentityDocV3Details">
		<xsl:text>документ, удостоверяющий личность: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:text>;</xsl:text>
	</xsl:template>
	<xsl:template match="*" mode="person">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'FullNameDetails']">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"> </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cacdo:InspectionDocIdDetails">
		<xsl:apply-templates select="csdo:CustomsOfficeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="csdo:DocCreationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="casdo:InspectionDocId"/>
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
	<xsl:template match="//*[local-name()='CustomsControlUnifiedDoc']//*" priority="-1">
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
