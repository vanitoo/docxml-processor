<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3" xmlns:eca="urn:customs.ru:Information:TransportDocuments:Railway:ExportCommercialAct:5.24.0">
	<!-- Шаблон для типа ExportCommercialActType -->
	<xsl:template match="eca:ExportCommercialAct">
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
										<b>Коммерческий акт РЖД</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
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
					</xsl:if-->
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер коммерческого акта</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:CommerceActNumber"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование перевозчика, составляющего коммерческий акт</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:CarrierName"/>
							</td>
						</tr>
					</table>
					<xsl:if test="eca:DepartureStation">
						<div class="title marg-top">Ж/д станция и дорога, на которой составляется коммерческий акт</div>
						<div>
							<xsl:apply-templates select="eca:DepartureStation">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата фактического установления обстоятельств, являющихся основанием для составления акта </td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:CommerceActDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование грузоотправителя</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:ConsignorName"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование грузополучателя</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:ConsigneeName"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование станции отправления</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:DispatchStation"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование станции назначения</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:DestinationStation"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер отправки</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="eca:Number">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата заключения договора перевозки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:ContractOfCarriageDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер вагона, ИТЕ, АТС</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="eca:CarriageID">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Количество доп. листов к коммерческому акту </td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:AddSheetsCount"/>
							</td>
						</tr>
					</table>
					<xsl:if test="eca:AddSheetToCommercAct">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дополнительный лист к коммерческому акту </td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="eca:AddSheetToCommercAct">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Реквизиты акта общей формы, на основании которого составляется коммерческий акт</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование документа</td>
								<td class="graphMain bordered">Номер документа</td>
								<td class="graphMain bordered">Дата документа</td>
							</tr>
							<xsl:for-each select="eca:GeneralAct">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Сведения о технической исправности/неисправности вагона/контейнера</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:TechnicallyServiceableInf"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Сведения о том, кем погружен груз (перевозчиком/отправителем)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:LoaderModeDescription"/>
							</td>
						</tr>
					</table>
					<xsl:if test="eca:VerificationResults">
						<div class="title marg-top">Результаты проверки</div>
						<div>
							<xsl:apply-templates select="eca:VerificationResults">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Обстоятельства, являющиеся основанием для составления коммерческого акта. Описание груза</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="eca:BasisForPreparationCommercAct"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Представители перевозчика</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Фамилия</td>
								<td class="graphMain bordered">Имя</td>
								<td class="graphMain bordered">Отчество</td>
								<td class="graphMain bordered">Должность</td>
							</tr>
							<xsl:for-each select="eca:CarrierPersons">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<div class="title marg-top">Представители отправителя / получателя (при участии в проверке груза)</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Фамилия</td>
								<td class="graphMain bordered">Имя</td>
								<td class="graphMain bordered">Отчество</td>
								<td class="graphMain bordered">Должность</td>
							</tr>
							<xsl:for-each select="eca:ConsPersons">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="eca:CarrierPersons">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonSurname"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonPost"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа eca:GoodsDescriptionType -->
	<xsl:template match="eca:CheckingResult">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:SignsMarksNumbers"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PlacesQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PackingType"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:GoodsName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:TotalWeigth" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PlaceWeigth" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="eca:ConsPersons">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonSurname"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PersonPost"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа eca:GoodsDescriptionType -->
	<xsl:template match="eca:DamagedPlaces">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:SignsMarksNumbers"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PlacesQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PackingType"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:GoodsName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:TotalWeigth" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PlaceWeigth" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа eca:StationType -->
	<xsl:template match="eca:DepartureStation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="eca:StationCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код станции</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="eca:StationCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тарифное наименование станции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="eca:StationName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="eca:RailwayCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код железной дороги </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="eca:RailwayCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="eca:RWName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование железной дороги</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="eca:RWName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="eca:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны расположения станции в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="eca:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="eca:GeneralAct">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа eca:GoodsDescriptionType -->
	<xsl:template match="eca:ListedOnInvoice">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:SignsMarksNumbers"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PlacesQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PackingType"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:GoodsName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:TotalWeigth" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:PlaceWeigth" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа eca:VerificationResultsType -->
	<xsl:template match="eca:VerificationResults">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top">Значится по накладной</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Знаки, марки, номера </td>
						<td class="graphMain bordered">Количество мест</td>
						<td class="graphMain bordered">Род упаковки</td>
						<td class="graphMain bordered">Наименование груза</td>
						<td class="graphMain bordered">Общая масса</td>
						<td class="graphMain bordered">Масса одного места</td>
					</tr>
					<xsl:for-each select="eca:ListedOnInvoice">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<div class="title marg-top">Оказалось при проверке</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Знаки, марки, номера </td>
						<td class="graphMain bordered">Количество мест</td>
						<td class="graphMain bordered">Род упаковки</td>
						<td class="graphMain bordered">Наименование груза</td>
						<td class="graphMain bordered">Общая масса</td>
						<td class="graphMain bordered">Масса одного места</td>
					</tr>
					<xsl:for-each select="eca:CheckingResult">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="eca:DamagedPlaces">
				<div class="title marg-top">В том числе поврежденных мест</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Знаки, марки, номера </td>
							<td class="graphMain bordered">Количество мест</td>
							<td class="graphMain bordered">Род упаковки</td>
							<td class="graphMain bordered">Наименование груза</td>
							<td class="graphMain bordered">Общая масса</td>
							<td class="graphMain bordered">Масса одного места</td>
						</tr>
						<xsl:for-each select="eca:DamagedPlaces">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template match="//*[local-name()='ExportCommercialAct']//*" priority="-1">
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
