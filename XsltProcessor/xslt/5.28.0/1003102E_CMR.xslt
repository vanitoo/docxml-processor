<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catTrans_ru catTrans_cu cat_ru cmr" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:catTrans_cu="urn:customs.ru:Information:TransportDocuments:CUTransportCommonAgregateTypesCust:5.24.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cmr="urn:customs.ru:Information:TransportDocuments:Car:CMR:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes" media-type="html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
	<xsl:template match="//*[local-name()='CMR']//*" priority="-1">
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
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cmr:CMR">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>CMR Международная товарно-транспортная накладная</title>
				<style type="text/css">
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					@media print {
					div.page {
					border: none;
					padding: 0;
					}
					}

					.graph {
					font-family: Arial, serif;
					font-size: 7pt;
					}

					.graphNo {
					font-size: 9pt;
					font-weight: bold;
					}
					.graphMain{
					font-size: 9pt;
					font-family: Arial, serif;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					td {
					border: 1px solid gray;
					font-family: Courier New, serif;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td class="graph" style="width: 85mm;">
								<span class="graphNo">1</span>
								Отправитель (наименование, адрес, страна)
							</td>
							<td align="center" rowspan="2" style="width:85mm;">
								<span style="font-family: Arial; font-weight: bold; font-size: 16pt;">CMR</span>
								<br/>
								<span style="font-family: Arial; font-weight: bold; font-size: 9pt;">
									Международная
									товарно-транспортная накладная
								</span>
								<br/>
								<br/>
								<xsl:apply-templates select="cmr:RegistrationDocument/cmr:RegID"/>
							</td>
						</tr>
						<tr valign="top">
							<td style="width:85mm;">
								<xsl:apply-templates select="cmr:Consignor"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">2</span>
								Получатель (наименование, адрес, страна)
							</td>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">16</span>
								Перевозчик (наименование, адрес, страна)
							</td>
						</tr>
						<tr valign="top">
							<td style="width:85mm;">
								<xsl:apply-templates select="cmr:Consignee"/>
							</td>
							<td style="width:85mm;">
								<xsl:apply-templates select="cmr:Carrier"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">3</span>
								Место разгрузки груза
							</td>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">17</span>
								Последующий перевозчик (наименование, адрес, страна)
							</td>
						</tr>
						<tr valign="top">
							<td style="width:85mm;">
								<span class="graph">Место </span>
								<xsl:if test="cmr:DeliveryPlace/cat_ru:StreetHouse">
									<xsl:apply-templates select="cmr:DeliveryPlace/cat_ru:StreetHouse"/>,
								</xsl:if>
								<xsl:if test="cmr:DeliveryPlace/cat_ru:City">
									<xsl:apply-templates select="cmr:DeliveryPlace/cat_ru:City"/>,
								</xsl:if>
								<xsl:if test="cmr:DeliveryPlace/cat_ru:Region">
									<xsl:apply-templates select="cmr:DeliveryPlace/cat_ru:Region"/>,
								</xsl:if>
								<xsl:if test="cmr:DeliveryPlace/cat_ru:CounryName">
									<xsl:apply-templates select="cmr:DeliveryPlace/cat_ru:CounryName"/>,
								</xsl:if>
								<xsl:if test="cmr:DeliveryPlace/cat_ru:PostalCode">
									<xsl:apply-templates select="cmr:DeliveryPlace/cat_ru:PostalCode"/>,
								</xsl:if>
								<xsl:if test="cmr:DeliveryPlace/cat_ru:CountryCode">
									<xsl:apply-templates select="cmr:DeliveryPlace/cat_ru:CountryCode"/>
								</xsl:if>
							</td>
							<td rowspan="3" style="width:85mm;">
								<xsl:apply-templates select="cmr:NextCarrier"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">4</span>
								Место и дата погрузки груза
							</td>
						</tr>
						<tr>
							<td style="width:85mm;">
								<span class="graph">Место </span>
								<xsl:if test="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:StreetHouse">
									<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:StreetHouse"/>,
								</xsl:if>
								<xsl:if test="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:City">
									<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:City"/>,
								</xsl:if>
								<xsl:if test="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:Region">
									<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:Region"/>,
								</xsl:if>
								<xsl:if test="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:CounryName">
									<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:CounryName"/>,
								</xsl:if>
								<xsl:if test="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:PostalCode">
									<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:PostalCode"/>,
								</xsl:if>
								<xsl:if test="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:CountryCode">
									<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoPlace/cat_ru:CountryCode"/>
								</xsl:if>
								<br/>
								<span class="graph">Дата</span>
								<xsl:apply-templates select="cmr:TakingCargo/cmr:TakingCargoDate" mode="russian_date"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">5</span>
								Прилагаемые документы
							</td>
							<td class="graph" style="width:85mm;">
								<span class="graphNo">18</span>
								Оговорки и замечания перевозчика
							</td>
						</tr>
						<tr>
							<td style="width:85mm;">
								<xsl:for-each select="cmr:EnclosedDocument">
									<xsl:apply-templates select="catTrans_ru:ModeCode"/>
									<xsl:if test="cat_ru:PrDocumentNumber">
										,
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
									</xsl:if>
									<xsl:if test="cat_ru:PrDocumentDate">
										,
										<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
									</xsl:if>
									<br/>
								</xsl:for-each>
							</td>
							<td style="width:85mm;">
								<xsl:apply-templates select="cmr:CarrierNotice"/>
							</td>
						</tr>
					</table>
					<table>
						<tr valign="top">
							<td class="graph">
								<span class="graphNo">6</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Знаки и номера
							</td>
							<td class="graph">
								<span class="graphNo">7</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Количество мест
							</td>
							<td class="graph">
								<span class="graphNo">8</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Род упаковки
							</td>
							<td class="graph">
								<span class="graphNo">9</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Наименование груза
							</td>
							<td class="graph">
								<span class="graphNo">10</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Статист. №
							</td>
							<td class="graph">
								<span class="graphNo">11</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Вес брутто, кг
							</td>
							<td class="graph">
								<span class="graphNo">12</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>Объем, м
								<sup>3</sup>
							</td>
						</tr>
						<xsl:for-each select="cmr:CMRGoods">
							<tr valign="top">
								<td>
									<xsl:apply-templates select="cat_ru:GoodsMarking"/>
								</td>
								<td>
									<xsl:apply-templates select="cmr:GoodsQuantity"/>
								</td>
								<td>
									<xsl:for-each select="cmr:GoodsPackingInfo">
										<xsl:apply-templates select="catTrans_cu:PakingQuantity"/>
										<xsl:if test="catTrans_cu:PackingDescription">
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="catTrans_cu:PackingDescription"/>
										</xsl:if>
										<xsl:if test="catTrans_cu:PackingCode or catTrans_cu:PakagePartQuantity">
											<xsl:text> (</xsl:text>
											<xsl:if test="catTrans_cu:PackingCode">
												<xsl:apply-templates select="catTrans_cu:PackingCode"/>
											</xsl:if>
											<xsl:if test="catTrans_cu:PakagePartQuantity">
												<xsl:if test="catTrans_cu:PackingCode">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="catTrans_cu:PakagePartQuantity"/>
												<xsl:text>-часть места</xsl:text>
											</xsl:if>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td>
									<xsl:for-each select="cat_ru:GoodsDescription">
										<xsl:if test="position() > 1">
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
								<td>
									<xsl:apply-templates select="catTrans_ru:GoodsNomenclatureCode"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td>
									<xsl:apply-templates select="cmr:GrossWeightQuantity"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td>
									<xsl:apply-templates select="catTrans_ru:VolumeQuantity"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</xsl:for-each>
						<tr valign="top">
							<td>
								<span class="graph">Класс </span>
								<xsl:apply-templates select="cmr:CMRGoods/catTrans_ru:HazardousCargoCode"/>
							</td>
							<td>
								<span class="graph">Цифра</span>
							</td>
							<td>
								<span class="graph">Буква</span>
							</td>
							<td>
								<span class="graph">ДОПОГ</span>
							</td>
							<td>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<xsl:choose>
							<xsl:when test="boolean (cmr:CMRGoodsWeight/cmr:GrossWeightQuantity)">
								<tr>
									<td colspan="7">
										<span class="graph">Общий вес товара, брутто (кг):</span>
										<xsl:apply-templates select="cmr:CMRGoodsWeight/cmr:GrossWeightQuantity"/>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr>
									<td colspan="7">
										<span class="graph">Общий вес товара, брутто (кг):</span>
									</td>
								</tr>
							</xsl:otherwise>
						</xsl:choose>
					</table>
					<table>
						<tr valign="top">
							<td class="graph" style="width:90mm;">
								<span class="graphNo">13</span>
								Указания отправителя (таможенная и прочая обработки)
							</td>
							<td class="graph" style="width:30mm;">
								<span class="graphNo">19</span>
								Подлежит оплате
							</td>
							<td class="graph" colspan="2" style="width:20mm;">Отправитель</td>
							<td class="graph" colspan="2" style="width:15mm;">Валюта</td>
							<td class="graph" colspan="2" style="width:20mm;">Получатель</td>
						</tr>
						<tr valign="top">
							<td rowspan="3">
								<xsl:apply-templates select="cmr:ConsigneeCustoms"/>
							</td>
							<td class="graph">Ставка</td>
							<td class="graph">
								<xsl:apply-templates select="cmr:CMRTransportCost/cmr:TransportCost"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="graph">Скидки</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="graph">Разность</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td class="graph">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graph">Информация о складе:</span>
								<xsl:choose>
									<xsl:when test="cmr:Consignor/cmr:Terminal/cmr:TerminalName">
										<br/>
										<xsl:apply-templates select="cmr:Consignor/cmr:Terminal/cmr:TerminalName"/>
										<br/>
										<xsl:apply-templates select="cmr:Consignor/cmr:Terminal/cmr:PlaceName"/>
										<br/>
										<xsl:apply-templates select="cmr:Consignor/cmr:Terminal/cmr:CountryName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cmr:Consignor/cmr:Terminal/cmr:CountryCode"/>
									</xsl:when>
									<xsl:otherwise>
										<br/>
										<xsl:text>не предоставлено</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="graph">Надбавки</td>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
						</tr>
						<tr>
							<td class="graph">Объявленная стоимость груза</td>
							<td class="graph">Дополнительные сборы</td>
							<td class="graph">
								<xsl:apply-templates select="cmr:CMRTransportCost/cmr:AdditionalCharges"/>
							</td>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
						</tr>
						<tr>
							<td class="graph">
								<xsl:apply-templates select="cmr:GoodsCost"/>
							</td>
							<td class="graph">Прочие</td>
							<td class="graph">
								<xsl:apply-templates select="cmr:CMRTransportCost/cmr:OtherCharges"/>
							</td>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
						</tr>
						<tr>
							<td class="graph"/>
							<td class="graph">Итого к оплате</td>
							<td class="graph">
								<xsl:apply-templates select="cmr:CMRTransportCost/cmr:TotalCost"/>
							</td>
							<td class="graph"/>
							<td class="graph">
								<xsl:apply-templates select="cmr:CMRTransportCost/cmr:CurrencyCode"/>
							</td>
							<td class="graph"/>
							<td class="graph"/>
							<td class="graph"/>
						</tr>
					</table>
					<table>
						<tr valign="top">
							<td class="graph" style="width:25mm;">
								<span class="graphNo">14</span>
								Возврат
							</td>
							<td bgcolor="#cccccc" class="graph" style="width:155mm;"/>
						</tr>
					</table>
					<table>
						<tr valign="top">
							<td class="graph" style="width:90mm;">
								<span class="graphNo">15</span>
								Условия оплаты
							</td>
							<td class="graph" style="width:90mm;">
								<span class="graphNo">20</span>
								Особые согласованные условия
							</td>
						</tr>
						<tr valign="top">
							<td>
								<span class="graph">
									Франко
									<br/>
								</span>
								<xsl:if test="(substring (cmr:DeliveryTerms/cmr:DeliveryTermsStringCode,1,1)='F')">
									<xsl:apply-templates select="cmr:DeliveryTerms/cmr:DeliveryTermsStringCode"/>
									<xsl:text> </xsl:text>
									<xsl:for-each select="cmr:DeliveryTerms/cmr:DeliveryPlace">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<xsl:if test="cmr:DeliveryTerms/cmr:TermsDescription">
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cmr:DeliveryTerms/cmr:TermsDescription"/>
									</xsl:if>
								</xsl:if>
							</td>
							<td rowspan="2">
								<xsl:apply-templates select="cmr:CMRTransport/cmr:SpecialConditionsText"/>
							</td>
						</tr>
						<tr valign="top">
							<td>
								<span class="graph">
									Нефранко
									<br/>
								</span>
								<xsl:if test="(substring (cmr:DeliveryTerms/cmr:DeliveryTermsStringCode,1,1)!='F') ">
									<xsl:apply-templates select="cmr:DeliveryTerms/cmr:DeliveryTermsStringCode"/>
									<xsl:text> </xsl:text>
									<xsl:for-each select="cmr:DeliveryTerms/cmr:DeliveryPlace">
										<xsl:apply-templates select="."/>
										<xsl:text> </xsl:text>
									</xsl:for-each>
									<xsl:if test="cmr:DeliveryTerms/cmr:TermsDescription">
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cmr:DeliveryTerms/cmr:TermsDescription"/>
									</xsl:if>
								</xsl:if>
							</td>
						</tr>
					</table>
					<table>
						<tr valign="top">
							<td class="graph" style="width:20mm;">
								<span class="graphNo">21</span>
								Составлена<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>в
							</td>
							<td style="width:40mm;">
								<xsl:apply-templates select="cmr:RegistrationDocument/cmr:Place"/>
							</td>
							<td class="graph" style="width:10mm;">Дата</td>
							<td style="width:55mm;">
								<xsl:apply-templates select="cmr:RegistrationDocument/cmr:Date" mode="russian_date"/>
							</td>
							<td class="graph" rowspan="2" style="width:55mm;">
								<span class="graphNo">
									24
									<br/>
									<br/>
								</span>
								Груз получен ________________________<br/>Прибыл под разгрузку ________________
								<br/>
								Убытие _____________________________
								<span class="graphNo">
									<br/>
									<br/>
								</span>
								Подпись и штамп получателя
							</td>
						</tr>
						<tr valign="top">
							<td class="graph" colspan="3">
								<span class="graphNo">22</span>
								<br/>Прибыл под погрузку _____________________________<br/>Убытие
								_________________________________________
								<br/>
								<br/>
								<br/>Подпись и штамп отправителя
							</td>
							<td class="graph">
								<span class="graphNo">23</span>
								<br/>Путевой лист № ___________________<br/>Фамилии __________________________
								<br/>водителей _________________________
								<br/>
								<br/>Подпись и штамп перевозчика
							</td>
						</tr>
					</table>
					<table>
						<tr valign="top">
							<td class="graph" style="width:45mm;">
								<span class="graphNo">25</span>
								Регистрац. номер<br/>Тягач/Полуприцеп
							</td>
							<td class="graph" style="width:45mm;">
								<span class="graphNo">26</span>
								Марка<br/>Тягач/Полуприцеп
							</td>
							<td class="graph" style="width:15mm;">
								<span class="graphNo">27</span>
								Тариф
							</td>
							<td class="graph" style="width:15mm;">Тарифное расстояние</td>
							<td class="graph" style="width:15mm;">% за испол. тягача/п/пр</td>
							<td class="graph" style="width:15mm;">Поясной коэфф.</td>
							<td class="graph" style="width:15mm;">Прочие доплаты</td>
							<td class="graph" style="width:15mm;">Сумма</td>
						</tr>
						<tr valign="top">
							<td nowrap="yes">
								<xsl:apply-templates select="cmr:CMRTransport/cmr:PrimeMoverStateSignID"/>
								<xsl:if test="string(cmr:CMRTransport/cmr:TrailerStateSignID)!=''">
									/<xsl:apply-templates select="cmr:CMRTransport/cmr:TrailerStateSignID"/>
								</xsl:if>
							</td>
							<td/>
							<td colspan="6"/>
						</tr>
					</table>
					<table>
						<tr valign="top">
							<td class="graph" rowspan="3">
								<span class="graphNo">28</span>
								<br/>Тариф<br/>II
							</td>
							<td class="graph">Тарифное расстояние, км</td>
							<td class="graph">Схема</td>
							<td class="graph">Тарифный вес, т</td>
							<td class="graph">
								Тариф<br/>за 1 т
							</td>
							<td class="graph">Надбавки</td>
							<td class="graph">Скидки</td>
							<td class="graph">Прочие доплаты</td>
							<td class="graph">
								К оплате
							</td>
							<td class="graph" colspan="2">Отчисления</td>
						</tr>
						<tr valign="top">
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" colspan="2">
								Оплачено<br/>заказчиком
							</td>
						</tr>
						<tr valign="top">
							<td class="graph" colspan="2">К оплате</td>
						</tr>
						<tr valign="top">
							<td class="graph" rowspan="2">
								<span class="graphNo">29</span>
								<br/>Тариф<br/>III
							</td>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" rowspan="2"/>
							<td class="graph" style="width:15mm;">Валюта</td>
							<td class="graph" style="width:40mm;">Код плательщика</td>
						</tr>
						<tr valign="top">
							<td class="graph" colspan="2">
								<br/>
								<br/>
								<br/>
							</td>
						</tr>
					</table>
					<table>
						<tbody>
							<tr>
								<xsl:choose>
									<xsl:when test="cmr:Mark">
										<td align="left" class="graph" style="width:150mm;border-right: 0px;">
											<xsl:apply-templates select="cmr:Mark/cmr:MarkKind"/> <xsl:apply-templates select="cmr:Mark/cmr:ResultControl"/>
										</td>
										<td align="right" class="graphMain" style="width:45mm;border-left: 0px;">
											<br/>
											<b>Штамп:</b>
											<u>
												<xsl:choose>
													<xsl:when test="cmr:StampSign='true' or cmr:StampSign='t' or cmr:StampSign='1'">
														Присутствует
													</xsl:when>
													<xsl:otherwise> Отсутствует</xsl:otherwise>
												</xsl:choose>
											</u>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" class="graphMain">
											<br/>
											<b>Штамп:</b>
											<u>
												<xsl:choose>
													<xsl:when test="cmr:StampSign='true' or cmr:StampSign='t' or cmr:StampSign='1'">
														Присутствует
													</xsl:when>
													<xsl:otherwise> Отсутствует</xsl:otherwise>
												</xsl:choose>
											</u>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cmr:Consignor | cmr:Consignee | cmr:Guarantee">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<br/>
		<xsl:apply-templates select="cmr:Address/RUScat_ru:StreetHouse"/>, <xsl:apply-templates select="cmr:Address/RUScat_ru:City"/>,
		<xsl:apply-templates select="cmr:Address/RUScat_ru:Region"/>
		<xsl:if test="string(cmr:Address/RUScat_ru:PostalCode)!=''">
			,
			<xsl:apply-templates select="cmr:Address/RUScat_ru:PostalCode"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cmr:Address/RUScat_ru:CountryCode"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cmr:Guarantee">
			<xsl:text>Поручитель </xsl:text>
			<xsl:apply-templates select="cmr:Guarantee"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cmr:Carrier | cmr:NextCarrier">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<br/>
		<xsl:apply-templates select="cmr:PostalAddress/RUScat_ru:StreetHouse"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cmr:PostalAddress/RUScat_ru:City"/>,
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cmr:PostalAddress/RUScat_ru:Region"/>
		<xsl:if test="string(cmr:PostalAddress/RUScat_ru:PostalCode)!=''">
			,
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="cmr:PostalAddress/RUScat_ru:PostalCode"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cmr:PostalAddress/RUScat_ru:CountryCode"/>
		<xsl:if test="cmr:LicenseID and local-name() = 'Carrier'">
			<br/>
			<xsl:text>Лицензия: </xsl:text>
			<xsl:apply-templates select="cmr:LicenseID"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cmr:ConsigneeCustoms">
		<xsl:apply-templates select="cmr:DestinationOfficeName"/>
		<br/>
		<xsl:apply-templates select="cmr:DestinationOfficeIdenifier"/>
		<br/>
		<xsl:if test="string(cmr:WarehouseName)!= ''">
			<br/>
			<xsl:apply-templates select="cmr:WarehouseName"/>
		</xsl:if>
		<xsl:apply-templates select="cmr:WarehouseLicenceID"/>
		<xsl:apply-templates select="cmr:WarehouseLicenceDate"/>
		<xsl:apply-templates select="cmr:WarehousePostalAddress "/>
	</xsl:template>
	<xsl:template match="cmr:WarehouseLicenceID">
		<br/>
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match=" cmr:WarehouseLicenceDate">
		<xsl:choose>
			<xsl:when test="string(../cmr:WarehouseLicenceID)!=''">,</xsl:when>
			<xsl:otherwise>
				<br/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="../cmr:WarehouseLicenceDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="cmr:WarehousePostalAddress ">
		<br/>
		<xsl:apply-templates select="cat_ru:StreetHouse"/>, <xsl:apply-templates select="cat_ru:City"/>,
		<xsl:apply-templates select="cat_ru:Region"/>
		<xsl:if test="string()!=''">
			,
			<xsl:apply-templates select="cat_ru:PostalCode"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:CountryCode"/>
	</xsl:template>
</xsl:stylesheet>
