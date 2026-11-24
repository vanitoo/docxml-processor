<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="whdi cat_ru catWH_ru" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:whdi="urn:customs.ru:Information:WarehouseDocuments:WHDocInventory:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="whdi:WHDocInventory">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Предоставление описи документов таможенному органу, осуществляющему контроль за функционированием СВХ./Перечень электронных документов</title>
				<style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 210mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    div.goods {background: white;}
                    .bordered {
                        border: solid 1px black;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }
                    .underlined {border-bottom: solid 0.8pt black;}
                    p.NumberDate {font-weight: bold;}
                    .graph {font-family: Arial; font-size: 7pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
                    .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
                    .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
                    .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
                    .graphNo {font-size: 7pt; font-weight: bold;}
                    h1{font-size: 12pt;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .br {border-right: 2px solid black;}
                    .bl {border-left: 2px solid black;}
                    .bb {border-bottom: 2px solid black;}
                    .bt {border-top: 2px solid black;}
                    .db {border-bottom: 1px dashed black;}
                    .dl {border-left: 1px dashed black;}
                    .number {
                        text-align: center;
                        color: black;
                        font-size: 11pt;
                        font-weight: bold;
                        vertical-align: middle;
                    }
                </style>
			</head>
			<body>
				<div class="page">
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
						<tbody>
							<tr>
								<td align="center" class="graphMain" style="width:180mm;">
								ОПИСЬ ДОКУМЕНТОВ<br/>
									<xsl:if test="whdi:RegNumberDoc">
									№ ДТ 
									<u>
											<xsl:apply-templates select="whdi:RegNumberDoc/cat_ru:CustomsCode"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates mode="russian_date_gtd" select="whdi:RegNumberDoc/cat_ru:RegistrationDate"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="whdi:RegNumberDoc/cat_ru:GTDNumber"/>
										</u>
										<br/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:180mm;">
									<br/>
									<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
										<tbody>
											<tr>
												<td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">№ п/п</td>
												<td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">Код вида документа</td>
												<td align="center" class="graph" style="width:60mm;border:solid 0.8pt #000000;">Номер и дата документа</td>
												<td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">Количество листов </td>
												<td align="center" class="graph" style="width:75mm;border:solid 0.8pt #000000;">Примечание </td>
											</tr>
											<xsl:for-each select="whdi:InventDocument">
												<tr>
													<td align="center" class="graph" style="width:10mm;border:solid 0.8pt #000000;">
														<xsl:value-of select="position()"/>
													</td>
													<td align="center" class="graph" style="width:25mm;border:solid 0.8pt #000000;">
														<xsl:value-of select="whdi:InvDocCode"/>
													</td>
													<td align="center" class="graph" style="width:60mm;border:solid 0.8pt #000000;">
														<xsl:value-of select="whdi:InvDocNumber"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="whdi:InvDocDate"/>
														</xsl:call-template>
													</td>
													<td align="center" class="graph" style="width:20mm;border:solid 0.8pt #000000;">
														<xsl:value-of select="whdi:InvDocLists"/>
													</td>
													<td class="graph" style="width:75mm;border:solid 0.8pt #000000;">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="whdi:Note">
															<xsl:value-of select="whdi:Note"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:180mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							
							<xsl:if test="whdi:IssueDateTime">
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Дата и время представления документов для помещения товаров на ВХ: </u>
										<xsl:apply-templates mode="russian_date_time" select="whdi:IssueDateTime"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="whdi:TotalPackageNumber">
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Общее количество грузовых мест: </u>
										<xsl:apply-templates select="whdi:TotalPackageNumber"/>
									</td>
								</tr>
							</xsl:if>
							
							<tr>
								<td class="graph" style="width:180mm;">
									<br/>
									<u> Отправитель описи: </u>
									<br/>
									<xsl:apply-templates select="whdi:Sender/whdi:Carrier"/>
									<xsl:for-each select="whdi:Sender/whdi:Customs">
										<xsl:apply-templates select="cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:OfficeName"/>
										<xsl:if test="whdi:CustomsPerson">
											<br/>
											Должностное лицо:
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonMiddleName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonPost"/>
											<xsl:text> </xsl:text>
											ЛНП: <xsl:apply-templates select="whdi:CustomsPerson/catWH_ru:LNP"/>
											<xsl:if test="whdi:CustomsPerson/catWH_ru:CustomsCode">
												<xsl:text> (код ТО: </xsl:text>
												<xsl:value-of select="whdi:CustomsPerson/catWH_ru:CustomsCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<br/>
									<u> Получатель описи: </u>
									<br/>
									<xsl:for-each select="whdi:Receiver/whdi:Customs">
										<xsl:apply-templates select="cat_ru:Code"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:OfficeName"/>
										<xsl:if test="whdi:CustomsPerson">
											<br/>
											Должностное лицо:
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonMiddleName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="whdi:CustomsPerson/cat_ru:PersonPost"/>
											<xsl:text> </xsl:text>
											ЛНП: <xsl:apply-templates select="whdi:CustomsPerson/catWH_ru:LNP"/>
											<xsl:if test="whdi:CustomsPerson/catWH_ru:CustomsCode">
												<xsl:text> (код ТО: </xsl:text>
												<xsl:value-of select="whdi:CustomsPerson/catWH_ru:CustomsCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="whdi:Receiver/whdi:SVH">
										<xsl:if test="whdi:DocumentModeCode"> Код вида документа: 
											<xsl:apply-templates select="whdi:DocumentModeCode"/>
										</xsl:if>
										<xsl:text> № документа </xsl:text>
										<xsl:apply-templates select="whdi:DocumentNumber"/>
										<xsl:if test="whdi:DO1PresentDocumentDate"> Дата предоставления ДО1: 
											<xsl:apply-templates mode="russian_date" select="whdi:DO1PresentDocumentDate"/>
										</xsl:if>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="whdi:DO1PresentDocumentTime"/>
									</xsl:for-each>
									<br/>
									<br/>
									<u>Лицо, представляющее документы для помещения товаров на ВХ: </u>
									<br/>
									<xsl:apply-templates select="whdi:Participant"/>
									<br/>
									<u>Владелец СВХ (иного места ВХ), на котором размещаются (предполагается разместить) товары: </u>
									<br/>
									<xsl:apply-templates select="whdi:WarehouseOwner"/>
									<br/>
									<xsl:if test="whdi:Transports">
										<br/>
										<u>Описание транспортных  средств</u>
										<br/>
										<xsl:for-each select="whdi:Transports">
											<xsl:value-of select="position()"/>.<br/>
									Код вида ТС <xsl:apply-templates select="catWH_ru:TransportModeCode"/>
											<br/>
									Номер ТС <xsl:apply-templates select="catWH_ru:TransportIdentifier"/>
											<br/>
											<xsl:choose>
												<xsl:when test="catWH_ru:Avia">Авиа:<br/>
													<xsl:if test="catWH_ru:Avia/catWH_ru:FlightNumber">
										- номер рейса: <xsl:apply-templates select="catWH_ru:Avia/catWH_ru:FlightNumber"/>
														<br/>
													</xsl:if>
													<xsl:if test="catWH_ru:Avia/catWH_ru:FlightDate">
										- дата рейса: <xsl:apply-templates mode="russian_date" select="catWH_ru:Avia/catWH_ru:FlightDate"/>
														<br/>
													</xsl:if>
												</xsl:when>
												<xsl:when test="catWH_ru:Avto">Авто:<br/>
													<xsl:if test="catWH_ru:Avto/catWH_ru:TrailerIdentifier">
										-номер прицепного транспортного средства <xsl:apply-templates select="catWH_ru:Avto/catWH_ru:TrailerIdentifier"/>
														<br/>
													</xsl:if>
													<xsl:if test="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier">
										-номер второго прицепного транспортного средства <xsl:apply-templates select="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier"/>
													</xsl:if>
												</xsl:when>
												<xsl:when test="catWH_ru:RailRoad">Ж/д:<br/>
													<xsl:if test="catWH_ru:RailRoad/catWH_ru:RailStation">
										-код станции отправления (для прибытия) или назначения (для убытия) <xsl:apply-templates select="catWH_ru:RailRoad/catWH_ru:RailStation"/>
														<br/>
													</xsl:if>
												</xsl:when>
												<xsl:when test="catWH_ru:Sea">Море/река:<br/>
													<xsl:if test="catWH_ru:Sea/catWH_ru:EntryNumber">
										-номер прихода/ухода: <xsl:apply-templates select="catWH_ru:Sea/catWH_ru:EntryNumber"/>
														<br/>
													</xsl:if>
													<xsl:if test="catWH_ru:Sea/catWH_ru:CountryCode">
										-данные о стране принадлежности судна: <xsl:apply-templates select="catWH_ru:Sea/catWH_ru:CountryCode"/>
														<br/>
													</xsl:if>
													<xsl:if test="catWH_ru:Sea/catWH_ru:Captain">
										-данные о капитане: <xsl:apply-templates select="catWH_ru:Sea/catWH_ru:Captain"/>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:if test="whdi:Carrier">
										<u>Сведения о перевозчике</u>
										<br/>
										<xsl:apply-templates select="whdi:Carrier"/>
									</xsl:if>
									<xsl:if test="whdi:GoodsShipment">
										<br/>
										<u>Описание товаро-транспортных накладных (товарных партий), представляемых при помещении товаров на временное хранение</u>
										<br/>
										<xsl:for-each select="whdi:GoodsShipment">
											<xsl:value-of select="position()"/>. 
									<xsl:apply-templates select="."/>
									Код документа <xsl:apply-templates select="catWH_ru:PresentedDocumentModeCode"/>
											<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:CompletteList">
									Номер связанных ТТН <xsl:for-each select="catWH_ru:WhCommDoc/catWH_ru:CompletteList">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
												<br/>
											</xsl:if>
											<xsl:if test="catWH_ru:ArrivalCargoWithoutDocsIndicator">
												<xsl:text> Груз без документов: </xsl:text>
												<xsl:choose>
													<xsl:when test="catWH_ru:ArrivalCargoWithoutDocsIndicator='true' or catWH_ru:ArrivalCargoWithoutDocsIndicator=1">да</xsl:when>
													<xsl:otherwise>нет</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:CustomNumber">
									Регистрационный номер <xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:CustomNumber"/>
												<br/>
											</xsl:if>
											<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor">
									Отправитель: <xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:CountryCode">
													<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:CountryCode"/> </xsl:if>
												<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:OrganizationName">
													<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:OrganizationName"/> </xsl:if>
												<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:Address">
													<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:Address"/>
												</xsl:if>
												<br/>
											</xsl:if>
											<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignee">
									Получатель: <xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignee"/>
												<br/>
											</xsl:if>
											<u>Описание товаров согласно накладной и товаросопроводительным документам</u>
											<br/>
											<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
												<tr>
													<td align="center" class="graph" rowspan="2" style="border:solid 0.8pt #000000;">Описание товара/Номер МПО/Номер емкости, в которой находится МПО</td>
													<td align="center" class="graph" rowspan="2" style="border:solid 0.8pt #000000;">Валовый номер товара по отчету</td>
													<td align="center" class="graph" rowspan="2" style="border:solid 0.8pt #000000;">Код товара по ТН ВЭД ЕАЭС</td>
													<td align="center" class="graph" rowspan="2" style="border:solid 0.8pt #000000;">Фактурная стоимость</td>
													<td align="center" class="graph" colspan="3" style="border:solid 0.8pt #000000;">Сведения о грузовых местах</td>
													<td align="center" class="graph" rowspan="2" style="border:solid 0.8pt #000000;">Вес брутто/объем</td>
													<td align="center" class="graph" rowspan="2" style="border:solid 0.8pt #000000;">Количество в дополнительных единицах измерения</td>
												</tr>
												<tr>
													<td align="center" class="graph" style="border:solid 0.8pt #000000;">Кол-во грузовых мест</td>
													<td align="center" class="graph" style="border:solid 0.8pt #000000;">Код вида упаковки (шруза)</td>
													<td align="center" class="graph" style="border:solid 0.8pt #000000;">Вид грузовых мест</td>
												</tr>
												<xsl:for-each select="whdi:Goods">
													<tr>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;">
															<xsl:choose>
																<xsl:when test="catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription">
										Описание товара: <xsl:for-each select="catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription">
																		<xsl:apply-templates select="."/>
																		<xsl:if test="position()!=last()"> </xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:when test="catWH_ru:MPONumber">
										Номер МПО 
										<xsl:apply-templates select="catWH_ru:MPONumber"/>
										<!--xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:ServiceIndicator"/>/<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:SerialNumber"/>/<xsl:value-of select="catWH_ru:MPONumber/catWH_ru:CountryCode"/-->
																</xsl:when>
																<xsl:when test="catWH_ru:MPOCaseNum">
										Номер емкости, в которой находится МПО <xsl:apply-templates select="catWH_ru:MPOCaseNum"/>
																</xsl:when>
															</xsl:choose>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> <xsl:apply-templates select="catWH_ru:GoodsNumber"/>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> 
												<xsl:if test="catWH_ru:GoodsTNVEDCode">
																<xsl:apply-templates select="catWH_ru:GoodsTNVEDCode"/>
															</xsl:if>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> <xsl:if test="catWH_ru:InvoiceCost">
																<xsl:apply-templates select="catWH_ru:InvoiceCost"/>
															</xsl:if>
															<xsl:if test="catWH_ru:CurrencyCode"> <xsl:apply-templates select="catWH_ru:CurrencyCode"/>
															</xsl:if>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> 
												<xsl:if test="catWH_ru:CargoPlace">
																<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
															</xsl:if>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> 
												<xsl:if test="catWH_ru:CargoPlace">
																<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PackageCode"/>
															</xsl:if>
														</td>
														<td class="graph" style="border:solid 0.8pt #000000;"> 
												<xsl:if test="catWH_ru:CargoPlace">
																<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceDescription"/>
															</xsl:if>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> 
												<xsl:if test="catWH_ru:BruttoVolQuant">
																<xsl:apply-templates select="catWH_ru:BruttoVolQuant"/>
															</xsl:if>
														</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;"> 
												<xsl:if test="catWH_ru:MeasureQuantity">
																<xsl:apply-templates select="catWH_ru:MeasureQuantity"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
											</table>
											<br/>
											<br/>
											<xsl:if test="whdi:Containers">
												<u>Описание контейнеров</u>
												<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
													<tr>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;">Номер контейнера</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;">Код размера контейнера по ГОСТ 52524-2005</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;">Код типа контейнера по ГОСТ 52524-2005</td>
														<td align="center" class="graph" style="border:solid 0.8pt #000000;">Вес брутто (кг) всех товаров в контейнере</td>
													</tr>
													<xsl:for-each select="whdi:Containers">
														<tr>
															<td align="center" class="graph" style="border:solid 0.8pt #000000;">
																<xsl:apply-templates select="catWH_ru:ContainerNumber"/>
															</td>
															<td align="center" class="graph" style="border:solid 0.8pt #000000;">
																<xsl:apply-templates select="catWH_ru:SizeCode"/>
															</td>
															<td align="center" class="graph" style="border:solid 0.8pt #000000;">
																<xsl:apply-templates select="catWH_ru:KindCode"/>
															</td>
															<td align="center" class="graph" style="border:solid 0.8pt #000000;">
																<xsl:apply-templates select="catWH_ru:GrossWeightQuantity"/>
															</td>
														</tr>
													</xsl:for-each>
												</table>
											</xsl:if>
											<br/>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<!--xsl:if test="whdi:WarehouseLicense">
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>Разрешительный документ склада, на который помещаются товары <xsl:apply-templates select="whdi:WarehouseLicense"/>
									</td>
								</tr>
							</xsl:if-->
							<tr>
								<td>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<br>
									<td class="graph" style="width:180mm;">
								Дата
									<u>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="whdi:InventoryInstanceDate"/>
											</xsl:call-template>
										</u>
									</td>
								</br>
							</tr>
							<tr>
								<td>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:180mm;">
								Подпись<text>__________________</text>
								</td>
							</tr>
							<tr>
								<td/>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="catWH_ru:WarehouseLicense | catWH_ru:ActualWarehouseLicense">
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="catWH_ru:CertificateNumber"/>
		<xsl:if test="catWH_ru:CertificateDate"> от 
			<xsl:apply-templates mode="russian_date" select="catWH_ru:CertificateDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="whdi:Address">
	Адрес: <xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/> </xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode"> (<xsl:apply-templates select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="catWH_ru:AddressLine">
			<br/>
			<xsl:apply-templates select="catWH_ru:AddressLine"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="catWH_ru:Captain">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, должность - <xsl:apply-templates select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="whdi:GoodsShipment">
		<!--номер, дата, название документа-->
		<span>
			<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
			</xsl:if> 
		<xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
			</xsl:if>
		</span>
		<br/>
	</xsl:template>
	<xsl:template match="catWH_ru:CustomNumber">
		<!--код/дата/номер-->
		<xsl:apply-templates select="cat_ru:CustomsCode"/>/<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>/<xsl:apply-templates select="cat_ru:GTDNumber"/>
		<br/>
	Номер по журналу регистрации <xsl:apply-templates select="catWH_ru:WaybillNumPP"/>
	</xsl:template>
	<xsl:template match="catWH_ru:Consignee">
		<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="catWH_ru:Address">
			<xsl:apply-templates select="catWH_ru:Address"/>
		</xsl:if>
		<xsl:if test="catWH_ru:IdentityCard">
			<xsl:apply-templates select="catWH_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="whdi:Carrier | whdi:Participant | whdi:WarehouseOwner">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">ИТН: 
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: 
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">УНП:
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">БИН:
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">ИИН:
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:text> / КПП: </xsl:text>
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catWH_ru:CountryCode">
			<br/>
		Цифровой код страны принадлежности:
		<xsl:apply-templates select="catWH_ru:CountryCode"/>
		</xsl:if>
		<xsl:if test="catWH_ru:WarehouseLicense">
			<br/>
		Документ, на основании которого разрешено временное хранение:
		<xsl:apply-templates select="catWH_ru:WarehouseLicense"/>
		</xsl:if>
		<xsl:if test="catWH_ru:ActualWarehouseLicense">
			<br/>
		Действующий документ владельца СВХ:
		<xsl:apply-templates select="catWH_ru:ActualWarehouseLicense"/>
		</xsl:if>
		<!--  <xsl:if test="whdi:Driver">
		<br/>
		Водитель: 
		<xsl:value-of select="whdi:Driver/cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="whdi:Driver/cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="whdi:Driver/cat_ru:PersonMiddleName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="whdi:Driver/cat_ru:PersonPost"/>
		</xsl:if>-->
		<xsl:if test="catWH_ru:CarrierPerson">
			<br/>
		Представитель перевозчика: 
		<xsl:apply-templates select="catWH_ru:CarrierPerson/cat_ru:PersonSurname"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="catWH_ru:CarrierPerson/cat_ru:PersonName"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="catWH_ru:CarrierPerson/cat_ru:PersonMiddleName"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="catWH_ru:CarrierPerson/cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="whdi:Ambassador">
			<br/>
		Представитель лица: 
		<xsl:apply-templates select="whdi:Ambassador/cat_ru:PersonSurname"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="whdi:Ambassador/cat_ru:PersonName"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="whdi:Ambassador/cat_ru:PersonMiddleName"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="whdi:Ambassador/cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="catWH_ru:WarehousePerson">
			<br/>
		Представитель лица: 
		<xsl:apply-templates select="catWH_ru:WarehousePerson/cat_ru:PersonSurname"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="catWH_ru:WarehousePerson/cat_ru:PersonName"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="catWH_ru:WarehousePerson/cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="catWH_ru:Address|whdi:Address">
			<br/>
			<xsl:apply-templates select="catWH_ru:Address|whdi:Address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:apply-templates select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:apply-templates select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>	
			ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="catWH_ru:Address">
	Адрес: <xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/> </xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode"> (<xsl:apply-templates select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="catWH_ru:AddressLine">
			<br/>
			<xsl:apply-templates select="catWH_ru:AddressLine"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="catWH_ru:IdentityCard">
		<span class="header">Документ, удостоверяющий личность:</span> 
	<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:IdentityCardName) and RUScat_ru:FullIdentityCardName">
			<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode"> </xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</span>
		 
	</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:apply-templates mode="russian_date" select="RUScat_ru:IdentityCardDate"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		 
	</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="catWH_ru:BruttoVolQuant | catWH_ru:MeasureQuantity">
		<!--кол-ко, ед-ца, код-->
		<xsl:apply-templates select="catWH_ru:GoodsQuantity" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:if test="catWH_ru:MeasureUnitQualifierName">
			<xsl:apply-templates select="catWH_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		(код <xsl:apply-templates select="catWH_ru:MeasureUnitQualifierCode"/>)
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
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='WHDocInventory']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
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
