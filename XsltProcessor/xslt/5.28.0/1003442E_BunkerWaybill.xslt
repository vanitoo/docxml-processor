<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bwb="urn:customs.ru:Information:TransportDocuments:BunkerWaybill:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cltpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonLeafTypes:5.17.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0">
	<!-- Шаблон для типа BunkerWaybillType -->
	<xsl:template match="bwb:BunkerWaybill">
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
										<b>Бункерная накладная</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:RegNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер бункерной накладной</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:RegNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата бункерной накладной</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:RegDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование бункеруемого судна</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:VesselName"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификационный номер бункеруемого судна (IMO)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:ShipIMONumber"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата поставки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:DeliveryDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Порт поставки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:DeliveryPort"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование судна- бункеровщика </td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:BunkeringVessel"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование топлива</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:FuelName"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Объем, м3</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:Volume" mode="translate_number"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Количество, т</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:Quantity" mode="translate_number"/>
							</td>
						</tr>
					</table>
					<xsl:if test="bwb:FuelTemperature">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Температура топлива, ºC</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:FuelTemperature" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:SulfurContent">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Содержание серы, %</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:SulfurContent" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:Viscosity">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Вязкость при 50ºC, сСт</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:Viscosity" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:Density">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Плотность при 15ºC, кг/м2 </td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:Density" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:FluidityTemperature">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Температура текучести, ºC</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:FluidityTemperature" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:FlashPoint">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Температура вспышки, ºC</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:FlashPoint" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:WaterContent">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Содержание воды, %</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:WaterContent" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:Declaration">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер декларации на товары</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:Declaration"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:DeclUseSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Декларирование припасов осуществлялось с использованием Декларации на товары</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="bwb:DeclUseSign='true' or bwb:DeclUseSign='1'">
											<xsl:text>ДА</xsl:text>
										</xsl:when>
										<xsl:when test="bwb:DeclUseSign='false' or bwb:DeclUseSign='0'">
											<xsl:text>НЕТ</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="bwb:DeclUseSign"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:TestResult">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Отметка о соответствии / несоответствии качественного состояния бункерного топлива (результаты проб)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:TestResult"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:SampleNumVessel">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер пробы для судна</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:SampleNumVessel"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:SampleNumBunker">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер пробы для бункеровщика</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:SampleNumBunker"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:SampleNumMARPOLVessel">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер пробы МАРПОЛ для судна</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:SampleNumMARPOLVessel"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="bwb:SampleNumMARPOLBunker">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер пробы МАРПОЛ для бункеровщика</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="bwb:SampleNumMARPOLBunker"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Подпись капитана либо иного лица, уполномоченного осуществить грузовую операцию по бункеровке/приему-передаче топлива</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:AuthorizedPersonVessel"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Подпись капитана бункеровщика либо иного лица, уполномоченного осуществить грузовую операцию по передаче топлива</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="bwb:AuthorizedPersonBunker"/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="bwb:Declaration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>

		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
		
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
	<xsl:template name="russian_date_gtd">
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
	<xsl:template match="//*[local-name()='BunkerWaybill']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
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
