<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru do1r" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:do1r="urn:customs.ru:Information:WarehouseDocuments:DO1Report:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	
	<xsl:param name="BusinessProcessType"/>
	<xsl:param name="DOStamp"/>
	
	<xsl:include href="ElSign.xslt"/>
	
	<xsl:key name="keyCurrency" match="catWH_ru:CurrencyCode" use="."/>
	
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
	<xsl:template match="//*[local-name()='DO1Report']//*" priority="-1">
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
	<xsl:template match="do1r:DO1Report">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>DO1Report</title>
				<style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: normal;*/ padding-left:4pt }
					td.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
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
					div.page { width: 297mm; /*height: 210mm;*/ margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {border: solid 1pt #000000;}
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graphUnderlined {font-family: Arial; font-size: 7pt; border-top: solid 0.8pt #000000}
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="3" cellspacing="0" width="260mm">
						<tr>
							<td colspan="2" style="width:260mm">
								<table border="0" cellpadding="3" cellspacing="0" style="width:260mm">
									<tbody>
										<tr>
											<td align="center" height="30mm" rowspan="3" style="width:150mm;border:solid 1.5pt #000000;">
												<span class="bold">
													<xsl:text>СВХ </xsl:text>
													<span class="value">
														<xsl:apply-templates select="catWH_ru:WarehouseOwner/cat_ru:OrganizationName"/>
													</span>
													<br/>
													<xsl:variable name="WHLicCertKind" select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind"/>
													<xsl:variable name="xpath_WHLicCertKind">
														<xsl:call-template name="get_xpath">
															<xsl:with-param name="node" select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind"/>
														</xsl:call-template>
													</xsl:variable>
													<element xml_node="{$xpath_WHLicCertKind}">
														<xsl:choose>
															<xsl:when test="$WHLicCertKind='lic_Certificate'"> Свидетельство о включении в реестр владельцев СВХ </xsl:when>
															<xsl:when test="$WHLicCertKind='lic_Licence'"> Лицензия владельца СВХ </xsl:when>
															<xsl:when test="$WHLicCertKind='lic_Permition'"> Разрешение ТО на временное хранение в ином месте </xsl:when>
															<xsl:when test="$WHLicCertKind='lic_PermZtk'"> ПЗТК </xsl:when>
															<xsl:when test="$WHLicCertKind='lic_TempZtk'"> ВЗТК </xsl:when>
															<xsl:otherwise> Свидетельство о включении в реестр владельцев СВХ </xsl:otherwise>
														</xsl:choose>
													</element>
													<xsl:if test="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
														<span class="value">
															<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate" mode="russian_date"/>
														</span>
													</xsl:if>
													<xsl:text> № </xsl:text>
													<span class="value">
														<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
													</span>
												</span>
												<br/>
												<span class="graph"> (при хранении товаров на складе получателя товаров указывается номер разрешения таможни) </span>
											</td>
											<td height="30mm" rowspan="3" style="width:80mm">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td align="center" height="8mm" style="width:30mm;border:solid 1.5pt #000000;">
												<span class="bold">Форма ДО1</span>
											</td>
										</tr>
										<tr>
											<td height="10mm" style="width:30mm"/>
										</tr>
										<tr>
											<td height="10mm" style="width:30mm"/>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center" class="bold" colspan="2" style="width:260mm">
								<br/>
								<xsl:text> Отчет № </xsl:text>
								<span class="valueMain">
									<xsl:apply-templates select="catWH_ru:ReportNumber"/>
								</span>
								<xsl:text> от </xsl:text>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<span class="valueMain">
									<xsl:apply-templates select="catWH_ru:ReportDate" mode="russian_date"/>
								</span>
								<br/>
								<xsl:text> о принятии товаров на хранение </xsl:text>
								<br/>
							</td>
						</tr>
						<xsl:if test="do1r:GoodsShipment/do1r:PresentedDocuments">
							<tr>
								<td align="center" class="bold" colspan="2" style="width:260mm">
									<br/>
									<xsl:text>Регистрационный номер при помещении товаров на ВХ </xsl:text>
									<span class="valueMain">
										<xsl:apply-templates mode="PresentedDocuments" select="do1r:GoodsShipment/do1r:PresentedDocuments"/>
									</span>
									<br/>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td style="width:260mm">
								<p align="left">
									<xsl:text>Перевозчик </xsl:text>
									<span class="value">
										<xsl:apply-templates select="//do1r:Carrier/cat_ru:OrganizationName"/>
									</span>
								</p>
							</td>
							<td align="center" style="width:260mm">
								<p align="left">
									<xsl:text>Код вида транспорта </xsl:text>
									<span class="value">
										<xsl:apply-templates select="catWH_ru:MainTransportModeCode"/>
										<xsl:text> - </xsl:text>
										<xsl:for-each select="do1r:Transports[catWH_ru:TransportModeCode=../catWH_ru:MainTransportModeCode]">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:apply-templates select="catWH_ru:TransportIdentifier"/>
										</xsl:for-each>
										<xsl:if test="do1r:Transports[catWH_ru:TransportModeCode!=../catWH_ru:MainTransportModeCode]">
											<xsl:text> (</xsl:text>
											<xsl:for-each select="do1r:Transports[catWH_ru:TransportModeCode!=../catWH_ru:MainTransportModeCode]">
												<xsl:if test="position()!=1">, </xsl:if>
												<xsl:apply-templates select="catWH_ru:TransportModeCode"/>
												<xsl:text> - </xsl:text>
												<xsl:apply-templates select="catWH_ru:TransportIdentifier"/>
											</xsl:for-each>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</span>
									<xsl:if test="do1r:GoodsShipment/do1r:MasterAirWayBill">
										<xsl:text> Авиа-накладная </xsl:text>
										<span class="value">
											<xsl:for-each select="do1r:GoodsShipment/do1r:MasterAirWayBill">
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:if test="cat_ru:PrDocumentDate">
													<xsl:text> от </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:if>
											</xsl:for-each>
										</span>
									</xsl:if>
								</p>
								<br/>
							</td>
						</tr>
					</table>
					<table border="0" cellpadding="1" cellspacing="0" width="260mm">
						<tr>
							<td align="left" style="width:260mm">Вид, дата и номер транспортного документа <span class="value">
									<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs">
										<xsl:apply-templates select="./catWH_ru:PresentedDocumentModeCode"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:if test="./cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="./cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:if>
										<xsl:if test="./cat_ru:PrDocumentNumber">
											<xsl:text> № </xsl:text>
											<xsl:apply-templates select="./cat_ru:PrDocumentNumber"/>
										</xsl:if>
										<xsl:if test="position()!=last()">
											<xsl:text>; </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr align="left">
							<td align="left" class="graph" style="width:260mm" valign="top">(если для указания сведений недостаточно места, допускается указывать их на обратной стороне основного листа отчета и делать запись "см. на обороте")
							</td>
						</tr>
						<tr>
							<td>
								<br/>
								<xsl:text>Приняты на хранение следующие товары (табл.)</xsl:text>
								<br/>
							</td>
						</tr>
						<tr>
							<td style="width:260mm">
								<xsl:if test="(do1r:GoodsShipment/do1r:MPOSign='0') or (do1r:GoodsShipment/do1r:MPOSign='f') or (do1r:GoodsShipment/do1r:MPOSign='false')">
									<table align="center" width="180mm">
										<tbody>
											<p align="center">
												<tr>
													<td class="bordered" align="center" style="width:10mm;">№ п/п</td>
													<td class="bordered" align="center" style="width:15mm;">Дата и время помещения на склад</td>
													<td class="bordered" align="center" style="width:30mm;">Наименование товара</td>
													<td class="bordered" align="center" style="width:15mm;">Код товара</td>
													<td class="bordered" align="center" style="width:20mm;">Складской номер товара</td>
													<td class="bordered" align="center" style="width:10mm;">Количество грузовых мест</td>
													<td class="bordered" align="center" style="width:20mm;">Вес товара брутто (в кг) или объем товара (в куб. м) (либо в доп. единицах измерения)</td>
													<td class="bordered" align="center" style="width:10mm;">Стоимость товара в валюте, указанной в транспортных или коммерческих документах</td>
													<td class="bordered" align="center" style="width:10mm;">Буквенный код валюты</td>
													<td class="bordered" align="center" style="width:40mm;">Примечание</td>
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
												</tr>
												<!--xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs"-->
												<!--xsl:for-each select="do1r:Goods"-->
												<!--xsl:variable name="TransportDocs" select="current()"/-->
												<xsl:variable name="TransportDocs" select="do1r:GoodsShipment/do1r:TransportDocs"/>
												<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods">
													<tr>
														<td class="bordered" align="center" style="width:10mm;">
															<xsl:apply-templates select="catWH_ru:GoodsNumber"/>
														</td>
														<td class="bordered" align="center" style="width:15mm;">
															<xsl:if test="catWH_ru:AcceptDateTime">
																<xsl:apply-templates select="catWH_ru:AcceptDateTime" mode="russian_date"/>
																<br/>
																<xsl:value-of select="substring(catWH_ru:AcceptDateTime,12,8)"/>
															</xsl:if>
														</td>
														<td class="bordered" align="center" style="width:30mm;">
															<xsl:for-each select="catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</td>
														<td class="bordered" align="center" style="width:15mm;">
															<xsl:if test="catWH_ru:GoodsTNVEDCode">
																<xsl:apply-templates select="catWH_ru:GoodsTNVEDCode"/>
															</xsl:if>
														</td>
														<td class="bordered" align="left" style="width:20mm;">
															<xsl:if test="catWH_ru:GoodsWHNumber">
																<xsl:apply-templates select="catWH_ru:GoodsWHNumber"/>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Area">,
													<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Area"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Parking">,
													<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Parking"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Square">
													,<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Square"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Comments">,
													<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Comments"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Angar">,
													<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Angar"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WHPackind">,
													<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:WHPackind"/>
																<xsl:text> </xsl:text>
															</xsl:if>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Cell">,
													<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Cell"/>
															</xsl:if>
															
															
														</td>
														<td class="bordered" align="right" style="width:10mm;">
															<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceNumber">
																<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
																<br/>
															</xsl:if>
															<xsl:variable name="goodsPos" select="position()"/>
															<xsl:for-each select="$TransportDocs/catWH_ru:GoodContLinks[catWH_ru:GoodNumber = $goodsPos]">
																<xsl:variable name="contPos" select="catWH_ru:ContainerNumber"/>
																<xsl:if test="position() != 1"><br/></xsl:if>
																<xsl:for-each select="../catWH_ru:Containers[position() = $contPos]">
																	<xsl:apply-templates select="catWH_ru:ContainerNumber"/>
																	<xsl:if test="catWH_ru:SizeCode and catWH_ru:KindCode">
																		<xsl:text> </xsl:text>
																		<xsl:apply-templates select="catWH_ru:SizeCode"/>
																		<xsl:text>/</xsl:text>
																		<xsl:apply-templates select="catWH_ru:KindCode"/>
																	</xsl:if>
																</xsl:for-each>
															</xsl:for-each>
														</td>
														<td class="bordered" align="center" style="width:20mm;">
															<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
															<xsl:text> </xsl:text>
															<xsl:if test="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
																<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
															</xsl:if>
																	(<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>)
																
														</td>
														<td class="bordered" align="center" style="width:10mm;">
															<xsl:apply-templates select="catWH_ru:InvoiceCost"/>
														</td>
														<td class="bordered" align="center" style="width:10mm;">
															<xsl:apply-templates select="catWH_ru:CurrencyCode"/>
														</td>
														<td class="bordered" align="center" style="width:40mm;">
															<xsl:apply-templates select="catWH_ru:Comments"/>
															<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator">
																<br/>
																<xsl:variable name="xpath_WithoutUnloadIndicator">
																	<xsl:call-template name="get_xpath">
																		<xsl:with-param name="node" select="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator"/>
																	</xsl:call-template>
																</xsl:variable>
																<element xml_node="{$xpath_WithoutUnloadIndicator}">
																	<xsl:choose>
																		<xsl:when test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='true' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='t' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='1'">хранение без выгрузки из ТС (контейнеров)</xsl:when>
																		<xsl:when test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='false' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='f' or catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator='0'">хранение c выгрузкой из ТС (контейнеров)</xsl:when>
																		<xsl:otherwise>
																			<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator"/>
																		</xsl:otherwise>
																	</xsl:choose>
																</element>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
												<!-- ИТОГО -->
												
												<xsl:variable name="listCurrency" select="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods/catWH_ru:CurrencyCode[generate-id() = generate-id(key('keyCurrency', .)[1])]"/>
												<tr>
													<td class="bordered" align="right" colspan="5">Итого:</td>
													<td class="bordered" align="center">
														<xsl:value-of select="sum(do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods/catWH_ru:CargoPlace/catWH_ru:PlaceNumber)"/>
													</td>
													<td class="bordered" align="center">
														<xsl:value-of select="sum(do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity)"/>
													</td>
													<td class="bordered" align="right">
														<xsl:for-each select="$listCurrency">
															<xsl:variable name="currency" select="."/>
															<xsl:if test="position() != 1"><br/></xsl:if>
															<xsl:value-of select="format-number(sum(../../catWH_ru:Goods[catWH_ru:CurrencyCode = $currency]/catWH_ru:InvoiceCost), '#.00')"/>
														</xsl:for-each>
													</td>
													<td class="bordered" align="center">
														<xsl:for-each select="$listCurrency">
															<xsl:variable name="currency" select="."/>
															<xsl:if test="position() != 1"><br/></xsl:if>
															<xsl:value-of select="$currency"/>
														</xsl:for-each>
													</td>
													<td class="bordered" align="center"/>
												</tr>
											</p>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="(do1r:GoodsShipment/do1r:MPOSign='1') or (do1r:GoodsShipment/do1r:MPOSign='t') or (do1r:GoodsShipment/do1r:MPOSign='true')">
									<table align="center" width="180mm">
										<tbody>
											<p align="center">
												<tr>
													<td class="bordered" align="center" style="width:10mm;">№ п/п</td>
													<td class="bordered" align="center" style="width:15mm;">Дата и время приема документов</td>
													<td class="bordered" align="center" style="width:30mm;">Номер МПО</td>
													<td class="bordered" align="center" style="width:15mm;">Код товара</td>
													<td class="bordered" align="center" style="width:15mm;">Номер емкости МПО</td>
													<td class="bordered" align="center" style="width:10mm;">Количество грузовых мест</td>
													<td class="bordered" align="center" style="width:25mm;">Вес МПО брутто (в кг) или объем МПО (в куб. м) (либо в доп. единицах измерения)</td>
													<td class="bordered" align="center" style="width:10mm;">Стоимость товара в валюте, указанной в транспортных или коммерческих документах</td>
													<td class="bordered" align="center" stye="width:10mm;">Код валюты</td>
													<td class="bordered" align="center" style="width:40mm;">Примечание</td>
												</tr>
												<tr>
													<td class="bordered" align="center" style="width:10mm;">1</td>
													<td class="bordered" align="center" style="width:15mm;">2</td>
													<td class="bordered" align="center" style="width:30mm;">3</td>
													<td class="bordered" align="center" style="width:15mm;">4</td>
													<td class="bordered" align="center" style="width:15mm;">5</td>
													<td class="bordered" align="center" style="width:10mm;">6</td>
													<td class="bordered" align="center" style="width:25mm;">7</td>
													<td class="bordered" align="center" style="width:10mm;">8</td>
													<td class="bordered" align="center" style="width:10mm;">9</td>
													<td class="bordered" align="center" style="width:40mm;">10</td>
												</tr>
												<!--xsl:variable name="TransportDocs" select="current()"/-->
												<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods">
													<tr>
														<td align="center" class="bordered" style="width:10mm;">
															<xsl:apply-templates select="catWH_ru:GoodsNumber"/>
														</td>
														<td align="center" class="bordered" style="width:15mm;">
															<xsl:if test="catWH_ru:AcceptDateTime">
																<xsl:apply-templates select="catWH_ru:AcceptDateTime" mode="russian_date"/>
																<br/>
																<xsl:value-of select="substring(catWH_ru:AcceptDateTime,12,8)"/>
															</xsl:if>
														</td>
														<td align="center" class="bordered" style="width:30mm;">
															<xsl:if test="catWH_ru:MPONumber">
																<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:ServiceIndicator"/>
																<!--xsl:text>/</xsl:text-->
																<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:SerialNumber"/>
																<!--xsl:text>/</xsl:text-->
																<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:CountryCode"/>
																<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:Number"/>
															</xsl:if>
														</td>
														<td class="bordered" align="center" style="width:15mm;"/>
														<td class="bordered" align="center" style="width:15mm;">
															<xsl:apply-templates select="catWH_ru:MPOCaseNumber"/>
														</td>
														<td class="bordered" align="center" style="width:10mm;">1</td>
														<td align="center" class="bordered" style="width:25mm;">
															<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/>
															<xsl:text> </xsl:text>
															<xsl:if test="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName">
																<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/>
															</xsl:if>
															(<xsl:apply-templates select="catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>)
														</td>
														<td class="bordered" align="center" style="width:10mm;"/>
														<td class="bordered" align="center" style="width:10mm;"/>
														<td class="bordered" align="center" style="width:40mm;">
															<xsl:if test="catWH_ru:Comments">
																<xsl:apply-templates select="catWH_ru:Comments"/> 
											</xsl:if>
															<xsl:if test="catWH_ru:MpoBillBruttoVolQuant">
																<xsl:apply-templates select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:GoodsQuantity"/> 
												<xsl:apply-templates select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
												<xsl:apply-templates select="catWH_ru:MpoBillBruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
											</p>
										</tbody>
									</table>
								</xsl:if>
							</td>
						</tr>
						<xsl:if test="string-length($BusinessProcessType) != 0 and count(do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:Goods) &gt; 49">
							<tr>
								<td align="right" style="width:250mm">
									<input type="button" onclick="window.external.GetNextPartDocument(-1)" value="Назад" />												
									<input type="button" onclick="window.external.GetNextPartDocument(1)" value="Далее" />
								</td>
							</tr>
						</xsl:if>
						<tr align="right">
							<td align="right">
								<table width="180mm">
									<tbody>
										<tr>
											<td colspan="2">
												<br/>
												<br/>
											</td>
										</tr>
										<tr>
											<td align="right">Указанные товары принял</td>
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
											<td>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td align="center" class="graph">(дата) (подпись, инициалы, фамилия и должность уполномоченного работника склада)</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<xsl:if test="$DOStamp">
					<xsl:apply-templates select="$DOStamp" mode="DOStamp">
						<xsl:with-param name="top" select="'25'"/>
						<xsl:with-param name="left" select="'210'"/>
					</xsl:apply-templates>
				</xsl:if>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr>
								<td style="font-weight: bold; text-align: center;">Дополнительные сведения</td>
							</tr>
							<xsl:if test="do1r:GoodsShipment/do1r:TotalPackageNumber">
								<tr>
									<td>
										<xsl:text>Общее количество грузовых мест: </xsl:text>
										<xsl:apply-templates select="do1r:GoodsShipment/do1r:TotalPackageNumber"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<xsl:text>Код вида транспортного средства: </xsl:text>
									<xsl:for-each select="do1r:Transports/catWH_ru:TransportModeCode">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<xsl:for-each select="do1r:GoodsShipment/do1r:TransportDocs/catWH_ru:WhCommDoc">
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #ccc;">
										<xsl:apply-templates select="../." mode="doc"/>
									</td>
								</tr>
								<tr>
									<td style="background-color: #eee;">Информация о товарной партии:</td>
								</tr>
								<xsl:if test="catWH_ru:CustomNumber">
									<tr>
										<td>
											<xsl:text>Рег.номер транспортного документа: </xsl:text>
											<xsl:apply-templates select="catWH_ru:CustomNumber" mode="reg_num"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="catWH_ru:Consignor">
									<tr>
										<td>
											<br/>
											<b>Отправитель</b>
											<br/>
											<xsl:apply-templates select="catWH_ru:Consignor" mode="org"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="catWH_ru:Consignee">
									<tr>
										<td>
											<br/>
											<b>Получатель</b>
											<br/>
											<xsl:apply-templates select="catWH_ru:Consignee" mode="org"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">/</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'RegistrationDate')">
					<xsl:apply-templates select="." mode="gtd_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="do1r:TransportDocs" mode="doc">
		<xsl:for-each select="*[contains(local-name(), 'PrDocument')]">
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Number')"> № </xsl:when>
				<xsl:when test="contains(local-name(), 'Date')"> от </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="catWH_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="catWH_ru:Address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressLine']">
				<xsl:apply-templates select="*[local-name() = 'AddressLine']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressLine']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name() = 'OGRN'">ОГРН </xsl:when>
				<xsl:when test="local-name() = 'INN'">ИНН </xsl:when>
				<xsl:when test="local-name() = 'KPP'">КПП </xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="PresentedDocuments" match="*">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="gtd_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
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
</xsl:stylesheet>
