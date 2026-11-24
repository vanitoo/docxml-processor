<?xml version="1.0" encoding="UTF-8"?>
<!--Приказ ФТС России № 444 от 18 марта 2019 года, Приложение 2-->
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru do2r" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:do2r="urn:customs.ru:Information:WarehouseDocuments:DO2Report:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	
	<xsl:param name="BusinessProcessType"/>
	<xsl:param name="DOStamp"/>
	
	<xsl:include href="ElSign.xslt"/>
	
	<xsl:key name="keyCurrency" match="*[local-name() = 'CurrencyCode']" use="."/>
	
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="do2r:DO2Report">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>DO2Report</title>
				<style type="text/css">
		 
				  body {    text-align: center; background: #cccccc; }
				  table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
				  td { font-size: 9.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
				  td.bold { font-size: 9.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }
				  td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
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
				  td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
				  td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
				  td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
				  span.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }
				  span.valueMain {border-bottom: solid 1px black; font-family: Arial; font-style: italic; font-weight: bold; }
				  .value {border-bottom: solid 1px black; font-style: italic; font-family: Arial; text-valign: bottom; }
				  div.page { /*width: 297mm; height: 210mm;*/ margin-top: 6pt; margin-bottom: 6pt; padding:5mm; padding-left:5mm; background: #ffffff; border: solid 1pt #000000; }
				  p.number-date { font-weight: bold; }
				  .bordered {border: solid 1pt #000000;}
				  .underlined { border-bottom: solid 0.8pt #000000; }
				  .graph { font-family: Arial; font-size: 7pt; }
				  .graph-number { font-size: 9pt; font-weight: bold; }
		 
				  @media print {
					  body {
						  zoom: 75%;
					  }
				  }
				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="3" cellspacing="0" width="270mm">
						<tr>
							<td style="width:270mm">
								<table border="0" cellpadding="3" cellspacing="0" width="270mm">
									<tbody>
										<!--Информация о СВХ (верхний левый угол)-->
										<tr>
											<td>
												<table border="0" cellpadding="3" cellspacing="0" width="250mm">
													<tr valign="top">
														<td align="center" height="30mm" rowspan="3" style="width:160mm;border:solid 1pt #000000;">
															<b>Склад временного хранения </b>
															<span class="valueMain">
																<xsl:apply-templates select="catWH_ru:WarehouseOwner/cat_ru:OrganizationName"/>
															</span>
															<br/>
															<b>Свидетельство о включении в реестр владельцев складов временного хранения от </b>
															<span class="valueMain">
																<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
																	<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate" mode="russian_date"/>
																</xsl:if>
															</span>
															<b> № </b>
															<span class="valueMain">
																<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
															</span>
															<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense">
																<br/>
																<b>Действующее свидетельство о включении в реестр владельцев складов временного хранения от </b>
																<span class="valueMain">
																	<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense/catWH_ru:CertificateDate">
																		<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense/catWH_ru:CertificateDate" mode="russian_date"/>
																	</xsl:if>
																</span>
																<b> № </b>
																<span class="valueMain">
																	<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:ActualWarehouseLicense/catWH_ru:CertificateNumber"/>
																</span>
															</xsl:if>
															<br/>
															<span class="graph">(при хранении товаров в ином месте временного хранения указывается номер разрешения таможни)</span>
														</td>
														<td/>
														<td style="width:23mm;border:solid 1pt #000000;">
															<b>Форма ДО-2</b>
														</td>
													</tr>
													<tr>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td></td>
														<td></td>
													</tr>
												</table>
											</td>
										</tr>
										<br/>
										<br/>
										<!--Тело документа -->
										<tr>
											<td>
												<table>
													<tbody>
														<tr>
															<td>
																<xsl:call-template name="DO2R_title"/>
																<br/>
																<br/>
															</td>
														</tr>
														<tr>
															<td>
																<xsl:call-template name="DO2R"/>
																<br/>
																<br/>
															</td>
														</tr>
														<xsl:if test="(do2r:GoodsShipment/do2r:MPOSign=1) or (do2r:GoodsShipment/do2r:MPOSign='t') or (do2r:GoodsShipment/do2r:MPOSign='true')">
															<tr align="right">
																<td align="right" style="width:180mm">
																	<xsl:call-template name="Signature"/>
																	<br/>
																	<br/>
																</td>
															</tr>
														</xsl:if>
														<!--tr>
															<td>
																<xsl:call-template name="DO2Radd"/>
																<br/>
																<br/>
															</td>
														</tr>
														<tr align="right">
															<td align="right" style="width:180mm;">
																<xsl:call-template name="Signature"/>
															</td>
														</tr-->
													</tbody>
												</table>
											</td>
										</tr>
										<xsl:if test="string-length($BusinessProcessType) != 0 and count(do2r:GoodsShipment/do2r:Goods) &gt; 49">
											<tr>
												<td align="right" style="width:250mm">
												<input type="button" onclick="window.external.GetNextPartDocument(-1)" value="Назад" />												
												<input type="button" onclick="window.external.GetNextPartDocument(1)" value="Далее" />
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<xsl:if test="$DOStamp">
					<xsl:apply-templates select="$DOStamp" mode="DOStamp">
						<xsl:with-param name="top" select="'25'"/>
						<xsl:with-param name="left" select="'320'"/>
					</xsl:apply-templates>
				</xsl:if>
			</body>
		</html>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DO3_date">
		<xsl:param name="year"/>
		<!--xsl:value-of select="substring (., 7, 2)"/>&#160;-->
		<!--xsl:variable name="month" select="substring($month,6, 2)"/-->
		<xsl:choose>
			<xsl:when test="$year=1">января</xsl:when>
			<xsl:when test="$year=2">февраля</xsl:when>
			<xsl:when test="$year=3">марта</xsl:when>
			<xsl:when test="$year=4">апреля</xsl:when>
			<xsl:when test="$year=5">мая</xsl:when>
			<xsl:when test="$year=6">июня</xsl:when>
			<xsl:when test="$year=7">июля</xsl:when>
			<xsl:when test="$year=8">августа</xsl:when>
			<xsl:when test="$year=9">сентября</xsl:when>
			<xsl:when test="$year=10">октября</xsl:when>
			<xsl:when test="$year=11">ноября</xsl:when>
			<xsl:when test="$year=12">декабря</xsl:when>
		</xsl:choose>                                                    
        <xsl:value-of select="substring($year, 1, 4)"/> г.
	</xsl:template>
	<xsl:template name="DO3_month">
		<xsl:param name="month"/>
		<!--xsl:value-of select="substring ($month, 6, 2)"/--> 
        
      <!--xsl:variable name="month" select="substring(., 6, 2)"/-->
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose>                                                    
	</xsl:template>
	<xsl:template name="DO2R">
		<table width="270mm">
			<tbody>
				<!--tr align="center">
				<td align="center" width="270mm">
					<span style="aligh:center">ОТЧЕТ № 
						xsl:apply-templates select="catWH_ru:ReportNumber"/>&#160;
						ОТ <xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template>
					&#160;О ВЫДАЧЕ ТОВАРОВ С СВХ 
					</span>
				</td>
			</tr>
			<tr>
				<td width="270mm">Транспортный документ (вид, дата и номер) 
					<xsl:apply-templates select="donr:TransportDoc/cat_ru:PrDocumentName"/>
					<xsl:apply-templates select="donr:TransportDoc/cat_ru:PrDocumentNumber"/>
					<xsl:apply-templates select="donr:TransportDoc/cat_ru:PrDocumentDate"/>
				</td>
			</tr-->
				<tr>
					<td>
						<xsl:choose>
							<xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=0) or (do2r:GoodsShipment/do2r:MPOSign='f') or (do2r:GoodsShipment/do2r:MPOSign='false')">
								<table style="width:250mm">
									<tr>
										<td class="bordered">  </td>
										<td class="bordered" align="center" colspan="10" style="width:155mm">
											<b>Приход</b>
										</td>
										<td class="bordered" align="center" colspan="7" style="width:85mm">
											<b>Расход</b>
										</td>
										<td class="bordered" align="center" colspan="3" style="width:40mm">
											<b>Остаток</b>
										</td>
									</tr>
									<tr>
										<!--1-->
										<td class="bordered" style="width:5mm">№ п/п</td>
										<!--2-->
										<td class="bordered" style="width:11mm">Дата и время поме-щения на склад</td>
										<!--3-->
										<td class="bordered" style="width:8mm">Номер отчета по форме ДО-1</td>
										<!--4-->
										<td class="bordered" style="width:10mm">Порядковый номер товара в отчете по форме ДО-1</td>
										<!--5-->
										<td class="bordered" style="width:18mm">Наиме-нование товара</td>
										<!--6-->
										<td class="bordered" style="width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td>
										<!--7-->
										<td class="bordered" style="width:11mm">Склад-ской номер товара</td>
										<!--8-->
										<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
										<!--9-->
										<td class="bordered" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
										<!--10-->
										<td class="bordered" style="width:17mm">Стоимость товара в валюте указанной в транспортных (перевозочных) или коммерческих документах</td>
										<!--11-->
										<td class="bordered" style="width:10mm">Буквенный код валюты</td>
										<!--12-->
										<td class="bordered" style="width:12mm">Дата и время выдачи со склада</td>
										<!--13-->
										<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
										<!--14-->
										<td class="bordered" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
										<!--15-->
										<td class="bordered" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб. м), исключая контейнеры и другое транспортное оборудование</td>
										<!--16-->
										<td class="bordered" style="width:17mm">Стоимость товара в валюте указанной в транспортных (перевозочных) или коммерческих документах</td>
										<!--17-->
										<td class="bordered" style="width:17mm">Основание выдачи товара со склада</td>
										<!--18-->
										<td class="bordered" style="width:18mm">Наиме-нование полу-чателя</td>
										<!--19-->
										<td class="bordered" style="width:7mm">Коли-чество гру-зовых мест</td>
										<!--20-->
										<td class="bordered" style="width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
										<!--21-->
										<td class="bordered" style="width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
									</tr>
									<tr>
										<td class="bordered" align="center">1</td>
										<td class="bordered" align="center">2</td>
										<td class="bordered" align="center">3</td>
										<td class="bordered" align="center">4</td>
										<td class="bordered" align="center">5</td>
										<td class="bordered" align="center">6</td>
										<td class="bordered" align="center">7</td>
										<td class="bordered" align="center">8</td>
										<td class="bordered" align="center">9</td>
										<td class="bordered" align="center">10</td>
										<td class="bordered" align="center">11</td>
										<td class="bordered" align="center">12</td>
										<td class="bordered" align="center">13</td>
										<td class="bordered" align="center">14</td>
										<td class="bordered" align="center">15</td>
										<td class="bordered" align="center">16</td>
										<td class="bordered" align="center">17</td>
										<td class="bordered" align="center">18</td>
										<td class="bordered" align="center">19</td>
										<td class="bordered" align="center">20</td>
										<td class="bordered" align="center">21</td>
									</tr>
									<xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
										<xsl:variable name="Input" select="count(do2r:Input)"/>
										<xsl:for-each select="do2r:Input">
											<xsl:variable name="pos" select="position()"/>
											<tr>
												<!--1 № п/п-->
												<td class="bordered" style="width:5mm">
													<xsl:apply-templates select="catWH_ru:GoodsNumber"/>
												</td>
												<!-- 2 Дата и время помещения на склад-->
												<td class="bordered" style="width:11mm">
													<!--xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1Date" mode="russian_date"/-->
													<xsl:apply-templates select="do2r:KeepingLimit/do2r:AcceptDate" mode="russian_date"/>
													<br/>
													<xsl:apply-templates select="do2r:KeepingLimit/do2r:AcceptTime" mode="russian_time"/>
                                       <!--xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1Time"/-->
												</td>
												<!--3 Номер отчета по форме ДО-1-->
												<td class="bordered" style="width:8mm">
													<xsl:choose>
														<xsl:when test="do2r:DO1GoodLink/do2r:RegisterNumberReport">
															<xsl:apply-templates select="do2r:DO1GoodLink/do2r:RegisterNumberReport"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1Number"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<!--4 Порядковый номер товаров в отчете по форме ДО-1-->
												<td class="bordered" style="width:10mm">
													<xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1GoodNumber"/>
												</td>
												<!--5 Наименование товара-->
												<td class="bordered" style="width:18mm">
													<xsl:apply-templates select="catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription"/>
												</td>
												<!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
												<td class="bordered" style="width:15mm">
													<xsl:apply-templates select="catWH_ru:GoodsTNVEDCode"/>
												</td>
												<!--7 складской номер-->
												<td class="bordered" style="width:11mm">
													<xsl:apply-templates select="do2r:WHNumber"/>
												</td>
												<!--8 Количество грузовых мест -->
												<td class="bordered" style="width:7mm">
													<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
												</td>
												<!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
												<td class="bordered" style="width:16mm">
													<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
													<br/>
													<xsl:apply-templates select="catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
												</td>
												<!--10  Стоимость товара в валюте указанной в транспортных (перевозочных) или коммерческих документах-->
												<td class="bordered" style="width:17mm">
													<xsl:apply-templates select="catWH_ru:InvoiceCost"/>
												</td>
												<!--11 Буквенный код валюты-->
												<td class="bordered" style="width:10mm">
													<xsl:apply-templates select="catWH_ru:CurrencyCode"/>
												</td>
												<xsl:choose>
													<xsl:when test="$pos=1">
														<!--12 Дата и время выдачи товара со склада-->
														<td class="bordered" style="width:12mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:OutputDate" mode="russian_date"/>
															<br/>
															<xsl:apply-templates select="../do2r:Output/do2r:OutputTime"/>
														</td>
														<!--13 Количество грузовых мест -->
														<td class="bordered" style="width:7mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
														</td>
														<!--14 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
														<td class="bordered" style="width:16mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
															<br/>
															<xsl:apply-templates select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
														</td>
														<!--15 Вес товара брутто (в кг) или объем товара (в куб.м), исключая контейнеры и другое транспортное оборудование-->
														<td class="bordered" style="width:16mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant2/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant2/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant2/catWH_ru:MeasureUnitQualifierCode"/>
														</td>
														<!--16  Стоимость товара в валюте, указанной в транспортных (перевозочных) или коммерческих документах-->
														<td class="bordered" style="width:17mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:Cost"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:CurrencyCode"/>
														</td>
													</xsl:when>
												</xsl:choose>
												<!--17 Основание выдачи товара со склада-->
												<td class="bordered" style="width:17mm">
													<!--xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute-->
													<xsl:variable name="Num" select="catWH_ru:GoodsNumber"/>
													<xsl:for-each select="(../../do2r:GoodsCustomDocsLinks)">
														<xsl:variable name="doc" select="do2r:CustomDocNumber"/>
														<xsl:if test="(do2r:GoodNumber)=$Num">
															<xsl:for-each select="../do2r:CustomsDocs[position()=$doc]">
																<xsl:if test="catWH_ru:WhGoodOutRegisterNumber">
																	<xsl:text>Уведомление: </xsl:text>
																	<br/>
																	<xsl:apply-templates select="catWH_ru:WhGoodOutRegisterNumber"/>
																	<hr/>
																	<!--br/-->
																</xsl:if>
																<xsl:apply-templates select="cat_ru:PrDocumentName"/>
																<xsl:text> </xsl:text>
																<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>	 
																<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/> 
																<xsl:apply-templates select="catWH_ru:DocumentCode"/> 	
																<xsl:apply-templates select="catWH_ru:VttCustomsCode"/>
																<br/>
															</xsl:for-each>
														</xsl:if>
													</xsl:for-each>
												</td>
												<xsl:choose>
													<xsl:when test="$pos=1">
														<!--18 Наиме-нование полу-чателя -->
														<td class="bordered" style="width:18mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
														</td>
														<!--19 Количество грузовых мест-->
														<td class="bordered" style="width:17mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
														</td>
														<!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
														<td class="bordered" style="width:17mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
															<br/>
															<xsl:apply-templates select="../do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
														</td>
														<!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
														<td class="bordered" style="width:18mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Result/do2r:Cost"/> 
						<xsl:apply-templates select="../do2r:Result/do2r:CurrencyCode"/>
														</td>
													</xsl:when>
													<!--xsl:otherwise><td><xsl:text disable-output-escaping="yes"> </xsl:text>   </td></xsl:otherwise-->
												</xsl:choose>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									
									<!-- ИТОГО -->
									<xsl:variable name="listCurrency" select="do2r:GoodsShipment/do2r:Goods/*/*[local-name() = 'CurrencyCode'][generate-id() = generate-id(key('keyCurrency', .)[1])]"/>
									<xsl:comment>
										<xsl:value-of select="count($listCurrency)"/>
									</xsl:comment>
									<xsl:variable name="mainContext" select="."/>
									
									<tr>
										<td class="bordered" align="right" colspan="7">Итого:</td>
										<!-- Input -->
										<td class="bordered" align="center"><!-- 8 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Input/catWH_ru:CargoPlace/catWH_ru:PlaceNumber)"/>
										</td>
										<td class="bordered" align="center"><!-- 9 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity)"/>
											<xsl:if test="do2r:GoodsShipment/do2r:Goods/do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity">
												<br/>
												<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity)"/>
											</xsl:if>
										</td>
										<td class="bordered" align="center"><!-- 10 -->
											<xsl:for-each select="$listCurrency">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:variable name="currency" select="."/>
												<xsl:value-of select="format-number(sum($mainContext/do2r:GoodsShipment/do2r:Goods/do2r:Input[catWH_ru:CurrencyCode = $currency]/catWH_ru:InvoiceCost), '0.00')"/>
											</xsl:for-each>
										</td>
										<td class="bordered" align="center"><!-- 11 -->
											<xsl:for-each select="$listCurrency">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
										<td class="bordered" align="center"/>
										<!-- Output -->
										<td class="bordered" align="center"><!-- 13 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Output/do2r:CargoPlace/catWH_ru:PlaceNumber)"/>
										</td>
										<td class="bordered" align="center"><!-- 14 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity)"/>
											<xsl:if test="do2r:GoodsShipment/do2r:Goods/do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity">
												<br/>
												<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity)"/>
											</xsl:if>
										</td>
										<td class="bordered" align="center"><!-- 15 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Output/do2r:BruttoVolQuant2/catWH_ru:GoodsQuantity)"/>
										</td>
										<td class="bordered" align="center"><!-- 16 -->
											<xsl:for-each select="$listCurrency">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:variable name="currency" select="."/>
												<xsl:value-of select="format-number(sum($mainContext/do2r:GoodsShipment/do2r:Goods/do2r:Output[do2r:CurrencyCode = $currency]/do2r:Cost), '0.00')"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="$currency"/>
											</xsl:for-each>
										</td>
										<td class="bordered" align="center" colspan="2"/>
										<!-- Result -->
										<td class="bordered" align="center"><!-- 19 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber)"/>
										</td>
										<td class="bordered" align="center"><!-- 20 -->
											<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity)"/>
											<xsl:if test="do2r:GoodsShipment/do2r:Goods/do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity">
												<br/>
												<xsl:value-of select="sum(do2r:GoodsShipment/do2r:Goods/do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity)"/>
											</xsl:if>
										</td>
										<td class="bordered" align="center"><!-- 21 -->
											<xsl:for-each select="$listCurrency">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:variable name="currency" select="."/>
												<xsl:value-of select="format-number(sum($mainContext/do2r:GoodsShipment/do2r:Goods/do2r:Result[do2r:CurrencyCode = $currency]/do2r:Cost), '0.00')"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="$currency"/>
											</xsl:for-each>
										</td>
									</tr>
								</table>
								<br/>
								<table style="width:250mm">
									<tr>
										<td class="bordered" style="width:15mm" align="center">
											<xsl:apply-templates select="do2r:GoodsShipment/do2r:ReasonKind"/>
										</td>
										<td class="bordered" style="width:55mm" align="center">Признак основания выдачи</td>
										<td/>
									</tr>
								</table>
							</xsl:when>
							<xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=1) or (do2r:GoodsShipment/do2r:MPOSign='t') or (do2r:GoodsShipment/do2r:MPOSign='true')">
								<table style="width:250mm">
									<tr>
										<td class="bordered">  </td>
										<td class="bordered" align="center" colspan="8">
											<b>Приход</b>
										</td>
										<td class="bordered" align="center" colspan="5">
											<b>Расход</b>
										</td>
										<!--td colspan="3" align="center"><b>Остаток</b></td-->
									</tr>
									<tr>
										<!--1-->
										<td class="bordered" style="width:5mm">№п/п</td>
										<!--2-->
										<td class="bordered" style="width:11mm">Дата и время поме-щения на склад</td>
										<!--3-->
										<td class="bordered" style="width:8mm">Номер отчета по форме ДО-1</td>
										<!--4-->
										<td class="bordered" style="width:10mm">Поряд-ковый номер МПО в отч-ете по форме ДО-1</td>
										<!--5-->
										<td class="bordered" style="width:18mm">Номер МПО</td>
										<!--6-->
										<!--td style= "width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td-->
										<!--7-->
										<td class="bordered" style="width:11mm">Номер емкости МПО</td>
										<!--8-->
										<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
										<!--9-->
										<td class="bordered" style="width:16mm">Вес МПО либо вес емкости </td>
										<!--10-->
										<!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
										<!--11-->
										<!--td style= "width:10mm">Буквенный код валюты</td-->
										<!--12-->
										<td class="bordered" style="width:12mm">Предельный срок вре-менного хранения</td>
										<!--13-->
										<td class="bordered" style="width:12mm">Дата и время выдачи МПО со склада</td>
										<!--14-->
										<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
										<!--15-->
										<td class="bordered" style="width:16mm">Вес МПО либо вес емкости </td>
										<!--16-->
										<!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
										<!--17-->
										<td class="bordered" style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача МПО со склада</td>
										<!--18-->
										<td class="bordered" style="width:18mm">Наиме-нование полу-чателя</td>
										<!--19-->
										<!--td style= "width:7mm">Коли-чество гру-зовых мест</td-->
										<!--20-->
										<!--td style= "width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td-->
										<!--21-->
										<!--td style= "width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
									</tr>
									<tr>
										<td class="bordered" align="center">1</td>
										<td class="bordered" align="center">2</td>
										<td class="bordered" align="center">3</td>
										<td class="bordered" align="center">4</td>
										<td class="bordered" align="center">5</td>
										<!--td align="center">6</td-->
										<td class="bordered" align="center">7</td>
										<td class="bordered" align="center">8</td>
										<td class="bordered" align="center">9</td>
										<!--td align="center">10</td>
					<td align="center">11</td-->
										<td class="bordered" align="center">12</td>
										<td class="bordered" align="center">13</td>
										<td class="bordered" align="center">14</td>
										<td class="bordered" align="center">15</td>
										<!--td align="center">16</td-->
										<td class="bordered" align="center">17</td>
										<td class="bordered" align="center">18</td>
										<!--td align="center">19</td>
					<td align="center">20</td>
					<td align="center">21</td-->
									</tr>
									<xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
										<xsl:variable name="Input" select="count(do2r:Input)"/>
										<xsl:for-each select="do2r:Input">
											<xsl:variable name="pos" select="position()"/>
											<tr>
												<!--1 №п/п-->
												<td class="bordered" style="width:5mm">
													<!--xsl:number value="position()"/-->
													<xsl:apply-templates select="catWH_ru:GoodsNumber"/>
												</td>
												<!-- 2 Дата и время помещения на склад-->
												<td class="bordered" style="width:11mm">
													<!--xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1Date" mode="russian_date"/-->
													<xsl:apply-templates select="do2r:KeepingLimit/do2r:AcceptDate" mode="russian_date"/>
													<!--br/>
                                       <xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1Time"/-->
												</td>
												<!--3 Номер отчета по форме ДО-1-->
												<td class="bordered" style="width:8mm">
													<xsl:choose>
														<xsl:when test="do2r:DO1GoodLink/do2r:RegisterNumberReport">
															<xsl:apply-templates select="do2r:DO1GoodLink/do2r:RegisterNumberReport"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="do2r:DO1GoodLink/do2r:DO1Number"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<!--4 Порядковый номер товаров в отчете по форме ДО-1-->
												<td class="bordered" style="width:10mm">
													<xsl:apply-templates select="do2r:DO1GoodLink/do2r:MPOIndexNum"/>
												</td>
												<!--5 Наименование товара-->
												<td class="bordered" style="width:18mm">
													<xsl:if test="catWH_ru:MPONumber">
														<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:ServiceIndicator"/>
														<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:SerialNumber"/>
														<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:CountryCode"/>
														<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:Number"/>
													</xsl:if>
													<xsl:if test="catWH_ru:MPOCaseNum">
														<xsl:apply-templates select="catWH_ru:MPOCaseNum"/>
												</xsl:if>
												</td>
												<!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
												<!--td>
						<xsl:apply-templates select="do2r:Input/catWH_ru:GoodsTNVEDCode"/>
					</td-->
												<!--7 складской номер-->
												<td class="bordered" style="width:11mm">
													<xsl:apply-templates select="do2r:CaseNumMPO"/>
												</td>
												<!--8 Количество грузовых мест -->
												<td class="bordered" style="width:7mm">
						1
					</td>
												<!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
												<td class="bordered" style="width:16mm">
													<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
													<br/>
													<xsl:apply-templates select="catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
												</td>
												<!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
												<!--td>
						<xsl:apply-templates select="do2r:Input/catWH_ru:InvoiceCost"/>
					</td-->
												<!--11 Буквенный код валюты-->
												<!--td>
						<xsl:apply-templates select="do2r:Input/catWH_ru:CurrencyCode"/>
					</td-->
												<!--12 Дата окончания временного хранения-->
												<td class="bordered" style="width:12mm">
													<xsl:apply-templates select="do2r:KeepingLimit/do2r:DeadLineDate" mode="russian_date"/>
												</td>
												<xsl:choose>
													<xsl:when test="$pos=1">
														<!--13 Дата и время выдачи товара со склада-->
														<td class="bordered" style="width:12mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:OutputDate" mode="russian_date"/>
															<br/>
															<xsl:apply-templates select="../do2r:Output/do2r:OutputTime"/>
														</td>
														<!--14 Количество грузовых мест -->
														<td class="bordered" style="width:7mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
						1
					</td>
														<!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
														<td class="bordered" style="width:16mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
															<br/>
															<xsl:apply-templates select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="../do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
														</td>
														<!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
														<!--td>
						<xsl:apply-templates select="do2r:Output/do2r:Cost"/>&#160;
						<xsl:apply-templates select="do2r:Output/do2r:CurrencyCode"/>
					</td-->
														<!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
														<td class="bordered" style="width:17mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:variable name="Num" select="catWH_ru:GoodsNumber"/>
															<xsl:for-each select="(../../do2r:GoodsCustomDocsLinks)">
																<xsl:variable name="doc" select="do2r:CustomDocNumber"/>
																<xsl:if test="(do2r:GoodNumber)=$Num">
																	<xsl:for-each select="../do2r:CustomsDocs[position()=$doc]">
																		<xsl:apply-templates select="cat_ru:PrDocumentName"/> 
														<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>	 
														<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/> 
														<xsl:apply-templates select="catWH_ru:DocumentCode"/> 	
														<xsl:apply-templates select="catWH_ru:VttCustomsCode"/>
																	</xsl:for-each>
																</xsl:if>
															</xsl:for-each>
															<!--xsl:apply-templates select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
												<br/>
												<xsl:apply-templates select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
												<br/>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="../do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate"/>
												</xsl:call-template-->
														</td>
														<!--18 Наиме-нование полу-чателя -->
														<td class="bordered" style="width:18mm">
															<xsl:attribute name="rowspan"><xsl:value-of select="$Input"/></xsl:attribute>
															<xsl:apply-templates select="../do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
														</td>
														<!--19 Количество грузовых мест-->
														<!--td>
						<xsl:apply-templates select="do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
					</td-->
														<!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
														<!--td>
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/><br/>
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
					</td-->
														<!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
														<!--td>
						<xsl:apply-templates select="do2r:Result/do2r:Cost"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:CurrencyCode"/>
					</td-->
													</xsl:when>
													<!--xsl:otherwise><td><xsl:text disable-output-escaping="yes"> </xsl:text>   </td></xsl:otherwise-->
												</xsl:choose>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</table>
							</xsl:when>
						</xsl:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DO2R_title">
		<table width="270mm">
			<tbody>
				<tr align="center">
					<td>
						<b>Отчет № </b>
						<span class="value">
							<xsl:apply-templates select="catWH_ru:ReportNumber"/>
						</span>
						<b> от </b>
						<span class="value">
							<xsl:apply-templates select="catWH_ru:ReportDate" mode="russian_date"/>
						</span>
						<br/>
					 <b>о выдаче товаров со склада временного хранения (иного места временного хранения) </b>
					</td>
				</tr>
				<!--tr>
					<td>Транспортный документ (вид, дата и номер) 
						<xsl:apply-templates select="do2r:GoodsShipment/do2r:Goods/do2r:TransportDoc/cat_ru:PrDocumentName"/>
						<xsl:apply-templates select="do2r:GoodsShipment/do2r:Goods/do2r:TransportDoc/cat_ru:PrDocumentNumber"/>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="do2r:GoodsShipment/do2r:Goods/do2r:TransportDoc/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr-->
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DO2Radd">
		<tr>
			<td align="center">
				<b>Добавочный лист №</b>
				<u>
					<xsl:apply-templates select="do2r:AddedListNumber"/>
					<xsl:text> </xsl:text>
				</u>
				<b>к отчету №</b>
				<u>
					<xsl:apply-templates select="catWH_ru:ReportNumber"/>
					<xsl:text> </xsl:text>
				</u>
				<b>от</b>
				<u>
					<xsl:apply-templates select="catWH_ru:ReportDate"/>
					<xsl:text> </xsl:text>
				</u>
				<b>о выдаче товаров с СВХ</b>
				<br/>
				<br/>
			</td>
		</tr>
		<br/>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=0) or (do2r:GoodsShipment/do2r:MPOSign='f') or (do2r:GoodsShipment/do2r:MPOSign='false')">
						<table width="250mm">
							<tr class="bordered">
								<td>  </td>
								<td align="center" class="bordered" colspan="10">
									<b>Приход</b>
								</td>
								<td class="bordered" align="center" colspan="7">
									<b>Расход</b>
								</td>
								<td class="bordered" align="center" colspan="3">
									<b>Остаток</b>
								</td>
							</tr>
							<tr>
								<!--1-->
								<td class="bordered" style="width:5mm">№ п/п</td>
								<!--2-->
								<td class="bordered" style="width:11mm">Дата и время поме-щения на склад</td>
								<!--3-->
								<td class="bordered" style="width:8mm">Номер отчета по форме ДО-1</td>
								<!--4-->
								<td class="bordered" style="width:10mm">Поряд-ковый номер товаров в отч-ете по форме ДО-1</td>
								<!--5-->
								<td class="bordered" style="width:18mm">Наиме-нование товара</td>
								<!--6-->
								<td class="bordered" style="width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td>
								<!--7-->
								<td class="bordered" style="width:11mm">Склад-ской номер товара</td>
								<!--8-->
								<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
								<!--9-->
								<td class="bordered" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
								<!--10-->
								<td class="bordered" style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
								<!--11-->
								<td class="bordered" style="width:10mm">Буквенный код валюты</td>
								<!--12-->
								<td class="bordered" style="width:12mm">Дата и время выдачи товара со склада</td>
								<!--13-->
								<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
								<!--14-->
								<td class="bordered" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
								<!--15-->
								<td class="bordered" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб. м), исключая контейнеры и другое транспортное оборудование  </td>
								<!--16-->
								<td class="bordered" style="width:17mm">Стоимость товара в валюте указанной в транспортных (перевозочных) или коммерческих документах</td>
								<!--17-->
								<td class="bordered" style="width:17mm">Основание выдачи товара со склада</td>
								<!--18-->
								<td class="bordered" style="width:18mm">Наиме-нование полу-чателя</td>
								<!--19-->
								<td class="bordered" style="width:7mm">Коли-чество гру-зовых мест</td>
								<!--20-->
								<td class="bordered" style="width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
								<!--21-->
								<td class="bordered" style="width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
							</tr>
							<tr>
								<td class="bordered" align="center">1</td>
								<td class="bordered" align="center">2</td>
								<td class="bordered" align="center">3</td>
								<td class="bordered" align="center">4</td>
								<td class="bordered" align="center">5</td>
								<td class="bordered" align="center">6</td>
								<td class="bordered" align="center">7</td>
								<td class="bordered" align="center">8</td>
								<td class="bordered" align="center">9</td>
								<td class="bordered" align="center">10</td>
								<td class="bordered" align="center">11</td>
								<td class="bordered" align="center">12</td>
								<td class="bordered" align="center">13</td>
								<td class="bordered" align="center">14</td>
								<td class="bordered" align="center">15</td>
								<td class="bordered" align="center">16</td>
								<td class="bordered" align="center">17</td>
								<td class="bordered" align="center">18</td>
								<td class="bordered" align="center">19</td>
								<td class="bordered" align="center">20</td>
								<td class="bordered" align="center">21</td>
							</tr>
							<xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
								<tr>
									<!--1 №п/п-->
									<td class="bordered">
										<xsl:number value="position()"/>
									</td>
									<!-- 2 Дата и время помещения на склад-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Date" mode="russian_date"/>
										<br/>
										<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Time"/>
									</td>
									<!--3 Номер отчета по форме ДО-1-->
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="do2r:Input/do2r:DO1GoodLink/do2r:RegisterNumberReport">
												<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:RegisterNumberReport"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Number"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!--4 Порядковый номер товаров в отчете по форме ДО-1-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1GoodNumber"/>
									</td>
									<!--5 Наименование товара-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription"/>
									</td>
									<!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:GoodsTNVEDCode"/>
									</td>
									<!--7 складской номер-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:WHNumber"/>
									</td>
									<!--8 Количество грузовых мест -->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
									</td>
									<!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
										<br/>
										<xsl:apply-templates select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
									</td>
									<!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:InvoiceCost"/>
									</td>
									<!--11 Буквенный код валюты-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:CurrencyCode"/>
									</td>
									<!--12 Дата и время выдачи товара со склада-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:OutputDate" mode="russian_date"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:OutputTime"/>
									</td>
									<!--13 Количество грузовых мест -->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
									</td>
									<!--14 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
									</td>
									<!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant2/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant2/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant2/catWH_ru:MeasureUnitQualifierCode"/>
									</td>
									<!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:Cost"/> 
						<xsl:apply-templates select="do2r:Output/do2r:CurrencyCode"/>
									</td>
									<!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<!--18 Наиме-нование полу-чателя -->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
									</td>
									<!--19 Количество грузовых мест-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
									</td>
									<!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
										<br/>
										<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
									</td>
									<!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Result/do2r:Cost"/> 
						<xsl:apply-templates select="do2r:Result/do2r:CurrencyCode"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:when>
					<xsl:when test="(do2r:GoodsShipment/do2r:MPOSign=1) or (do2r:GoodsShipment/do2r:MPOSign='t') or (do2r:GoodsShipment/do2r:MPOSign='true')">
						<table width="250mm">
							<tr>
								<td class="bordered">  </td>
								<td class="bordered" align="center" colspan="9">
									<b>Приход</b>
								</td>
								<td class="bordered" align="center" colspan="4">
									<b>Расход</b>
								</td>
								<!--td colspan="3" align="center"><b>Остаток</b></td-->
							</tr>
							<tr>
								<!--1-->
								<td class="bordered" style="width:5mm">№п/п</td>
								<!--2-->
								<td class="bordered" style="width:11mm">Дата и время поме-щения на склад</td>
								<!--3-->
								<td style="width:8mm" class="bordered">Номер отчета по форме ДО-1</td>
								<!--4-->
								<td class="bordered" style="width:10mm">Поряд-ковый номер МПО в отч-ете по форме ДО-1</td>
								<!--5-->
								<td class="bordered" style="width:18mm">Номер МПО</td>
								<!--6-->
								<!--td style= "width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td-->
								<!--7-->
								<td class="bordered" style="width:11mm">Номер емкости МПО</td>
								<!--8-->
								<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
								<!--9-->
								<td class="bordered" style="width:16mm">Вес МПО либо вес емкости </td>
								<!--10-->
								<!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
								<!--11-->
								<!--td style= "width:10mm">Буквенный код валюты</td-->
								<!--12-->
								<td class="bordered" style="width:12mm">Предельный срок вре-менного хранения</td>
								<!--13-->
								<td class="bordered" style="width:12mm">Дата и время выдачи МПО со склада</td>
								<!--14-->
								<td class="bordered" style="width:7mm">Коли-чество грузовых мест</td>
								<!--15-->
								<td class="bordered" style="width:16mm">Вес МПО либо вес емкости </td>
								<!--16-->
								<!--td style= "width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
								<!--17-->
								<td class="bordered" style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача МПО со склада</td>
								<!--18-->
								<td class="bordered" style="width:18mm">Наиме-нование полу-чателя</td>
								<!--19-->
								<!--td style= "width:7mm">Коли-чество гру-зовых мест</td-->
								<!--20-->
								<!--td style= "width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td-->
								<!--21-->
								<!--td style= "width:18mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td-->
							</tr>
							<tr>
								<td class="bordered" align="center">1</td>
								<td class="bordered" align="center">2</td>
								<td class="bordered" align="center">3</td>
								<td class="bordered" align="center">4</td>
								<td class="bordered" align="center">5</td>
								<!--td align="center">6</td-->
								<td class="bordered" align="center">7</td>
								<td class="bordered" align="center">8</td>
								<td class="bordered" align="center">9</td>
								<!--td align="center">10</td>
					<td align="center">11</td-->
								<td class="bordered" align="center">12</td>
								<td class="bordered" align="center">13</td>
								<td class="bordered" align="center">14</td>
								<td class="bordered" align="center">15</td>
								<!--td align="center">16</td-->
								<td class="bordered" align="center">17</td>
								<td class="bordered" align="center">18</td>
								<!--td align="center">19</td>
					<td align="center">20</td>
					<td align="center">21</td-->
							</tr>
							<xsl:for-each select="do2r:GoodsShipment/do2r:Goods">
								<tr>
									<!--1 №п/п-->
									<td class="bordered">
										<xsl:number value="position()"/>
									</td>
									<!-- 2 Дата и время помещения на склад-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Date" mode="russian_date"/>
										<br/>
										<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Time"/>
									</td>
									<!--3 Номер отчета по форме ДО-1-->
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="do2r:Input/do2r:DO1GoodLink/do2r:RegisterNumberReport">
												<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:RegisterNumberReport"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:DO1Number"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!--4 Порядковый номер товаров в отчете по форме ДО-1-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:DO1GoodLink/do2r:MPOIndexNum"/>
									</td>
									<!--5 Наименование товара-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription"/>
									</td>
									<!--6 Код товара в соответствии с ГС или ТН ВЭД ЕАЭС-->
									<!--td>
						<xsl:apply-templates select="do2r:Input/catWH_ru:GoodsTNVEDCode"/>
					</td-->
									<!--7 складской номер-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:CaseNumMPO"/>
									</td>
									<!--8 Количество грузовых мест -->
									<td class="bordered">
						1
					</td>
									<!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
										<br/>
										<xsl:apply-templates select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
									</td>
									<!--10  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
									<!--td>
						<xsl:apply-templates select="do2r:Input/catWH_ru:InvoiceCost"/>
					</td-->
									<!--11 Буквенный код валюты-->
									<!--td>
						<xsl:apply-templates select="do2r:Input/catWH_ru:CurrencyCode"/>
					</td-->
									<!--12 Дата окончания временного хранения-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:KeepingLimit/do2r:DeadLineDate" mode="russian_date"/>
									</td>
									<!--13 Дата и время выдачи товара со склада-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Input/do2r:OutputDate" mode="russian_date"/>
										<br/>
										<xsl:apply-templates select="do2r:Input/do2r:OutputTime"/>
									</td>
									<!--14 Количество грузовых мест -->
									<td class="bordered">
						1
					</td>
									<!--15 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Output/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do2r:Output/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
									</td>
									<!--16  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
									<!--td>
						<xsl:apply-templates select="do2r:Output/do2r:Cost"/>&#160;
						<xsl:apply-templates select="do2r:Output/do2r:CurrencyCode"/>
					</td-->
									<!--17 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentName"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
										<br/>
										<xsl:apply-templates select="do2r:Output/do2r:OrderCustDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<!--18 Наиме-нование полу-чателя -->
									<td class="bordered">
										<xsl:apply-templates select="do2r:Output/do2r:Consignee/cat_ru:OrganizationName"/>
									</td>
									<!--19 Количество грузовых мест-->
									<!--td>
						<xsl:apply-templates select="do2r:Result/do2r:CargoPlace/catWH_ru:PlaceNumber"/>
					</td-->
									<!--20 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения) -->
									<!--td>
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/><br/>
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:GoodsQuantity"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
					</td-->
									<!--21  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
									<!--td>
						<xsl:apply-templates select="do2r:Result/do2r:Cost"/>&#160;
						<xsl:apply-templates select="do2r:Result/do2r:CurrencyCode"/>
					</td-->
								</tr>
							</xsl:for-each>
						</table>
					</xsl:when>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="SignatureAndSheets">
		<table width="270mm">
			<tr>
				<td style="width:135mm">Количество добавочных листов отчета
					<xsl:apply-templates select="do2r:AddedListsCount"/>
				</td>
				<td>
					<xsl:apply-templates select="catWH_ru:ReportDate" mode="russian_date"/>
				</td>
				<td>
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/> 
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/> 
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/> 
				</td>
			</tr>
			<tr align="right">
				<td/>
				<td>(дата)
				</td>
				<td>(подпись, инициалы, фамилия, и должность уполномоченного работника склада)
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Signature">
		<table width="180mm">
			<!--tr align="right">
					<td style="width:185mm">
					</td>
					<td>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template>
					</td>
					<td>
						xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/>&#160;
						xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>&#160;
						xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>&#160;
						xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>&#160;
					</td>
				</tr>
				<tr  align="right">
					<td>
					</td>
					<td>(дата)
					</td>
					<td>(подпись, инициалы, фамилия, и должность уполномоченного работника склада)
					</td>
				</tr-->
			<tbody>
				<tr>
					<td>
						<br/>
						<br/>
					</td>
				</tr>
				<tr>
					<td align="center">
						<span class="value">
							<xsl:apply-templates select="catWH_ru:ReportDate" mode="russian_date"/>
							<xsl:text> &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;</xsl:text>
							<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
												<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
								<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
							</xsl:if>
						</span>
					</td>
				</tr>
				<tr>
					<td align="center" class="graph">(дата) (подпись, инициалы, фамилия и должность уполномоченного работника склада)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="do2r:Input/do2r:DO1GoodLink/do2r:RegisterNumberReport | do2r:DO1GoodLink/do2r:RegisterNumberReport | catWH_ru:WhGoodOutRegisterNumber">
		<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
		<xsl:variable name="date">
			<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
		<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='DO2Report']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(., 1, 5)"/>
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
</xsl:stylesheet>
