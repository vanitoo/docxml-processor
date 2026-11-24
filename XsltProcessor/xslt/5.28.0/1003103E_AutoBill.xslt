<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:atb="urn:customs.ru:Information:TransportDocuments:AutoBill:5.28.0">
	<!-- Шаблон для типа AutoBillType -->
	<xsl:template match="atb:AutoBill">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body
					{background: #cccccc;}

					div.page
					{width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top: 5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-size: 10pt;}

					table.border tr td
					{border: 1px solid gray;
					font-size: 10pt;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.graphBold
					{font-family: Arial;
					font-size: 7pt;
					font-weight: bold;}

					.value
					{border-bottom: solid 1px black;
					font-size: 10pt;}

					div.title, tr.title td
					{font-weight: bold;}

					.bordered
					{border-collapse: collapse;
					font-size: 10pt;}

					.littlebordered
					{border-collapse: collapse;
					font-size: 8pt;}

					td.littlebordered
					{border: solid 1px windowtext;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align: top;}

					td.value.graphMain
					{vertical-align: bottom;}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>ТРАНСПОРТНАЯ НАКЛАДНАЯ</b><br/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190 bordered">
						<tbody>
							<tr>
								<td width="50%" align="center" class="bordered">Транспортная накладная</td>
								<td width="50%" align="center" class="bordered">Заказ (заявка)</td>
							</tr>
							<tr>
								<td class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td width="25%"><xsl:text>Дата</xsl:text></td>
												<td width="25%" align="center"><xsl:apply-templates select="atb:DateTN" mode="russian_date"/></td>
												<td width="15%" align="right">№</td>
												<td width="35%" align="center"><xsl:apply-templates select="atb:NumberTN"/></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td width="25%"><xsl:text>Дата</xsl:text></td>
												<td width="25%" align="center"><xsl:apply-templates select="atb:Order/atb:DateOrder" mode="russian_date"/></td>
												<td width="15%" align="right">№</td>
												<td width="35%" align="center"><xsl:apply-templates select="atb:Order/atb:NumberOrder"/></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td width="50%"><xsl:text>Экземпляр №</xsl:text></td>
												<td width="50%"><xsl:apply-templates select="atb:NumberCopies"/></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="bordered"></td>
							</tr>
							<tr>
								<td class="bordered" align="center"><b>1. Грузоотправитель</b></td>
								<td rowspan="2" class="bordered" align="center"><b>1а. Заказчик услуг по организации перевозки груза (при наличии)</b></td>
							</tr>
							<tr>
								<td class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td><xsl:text>является экспедитором</xsl:text></td>
												<xsl:variable name="xpath_Forwarder">
													<xsl:call-template name="get_xpath">
														<xsl:with-param name="node" select="atb:Forwarder"/>
													</xsl:call-template>
												</xsl:variable>
												<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
													<element xml_node="{$xpath_Forwarder}">
														<xsl:choose>
															<xsl:when test="(number(atb:Forwarder)=1) or (atb:Forwarder='t')">
																<span class="graphBold">х</span>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</element>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="bordered"><xsl:apply-templates select="atb:Consignor"/></td>
								<td class="bordered"><xsl:apply-templates select="atb:Customer"/></td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать Грузоотправителя)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать Заказчика услуг по организации перевозки груза)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered" align="center"><xsl:apply-templates mode="document" select="atb:CalculationDoc"/></td>
								<td class="bordered" align="center"><xsl:apply-templates mode="document" select="atb:TransportationContract"/></td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты документа, определяющего основания осуществления расчетов по договору перевозки иным лицом, отличным от грузоотправителя)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты договора на выполнение услуг по организации перевозки груза)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>2. Грузополучатель</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:Consignee"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать Грузополучателя)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:choose>
										<xsl:when test="atb:DeliveryPlace">
											<xsl:apply-templates select="atb:DeliveryPlace"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="atb:DeliveryAddress"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center"><xsl:text>(адрес места доставки груза)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>3. Груз</b></td>
							</tr>
							<xsl:for-each select="atb:Cargo">
								<tr>
									<td class="bordered">
										<table>
											<tbody>
												<xsl:if test="atb:CargoDescription">
													<tr>
														<td valign="top" style="border-right:1px dashed" width="50%">
															<xsl:text>Отгрузочное наименование груза:</xsl:text>
														</td>
														<td valign="top" width="50%">
															<xsl:apply-templates select="atb:CargoDescription"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:Package/atb:CargoState">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Состояние груза:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:Package/atb:CargoState"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:ContainerQuantity or atb:ContainerIdentificator">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Сведения о контейнерах:</xsl:text>
														</td>
														<td valign="top">
															<xsl:text>Количество: </xsl:text>
															<xsl:apply-templates select="atb:ContainerQuantity"/>
															<xsl:text>, Номера (идентификаторы): </xsl:text>
															<xsl:for-each select="atb:ContainerIdentificator">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</tbody>
										</table>
									</td>
									<td class="bordered">
										<table>
											<tbody>
												<xsl:if test="atb:Package/atb:CargoState">
													<tr>
														<td valign="top" style="border-right:1px dashed" width="50%">
															<xsl:text>Количество грузовых мест:</xsl:text>
														</td>
														<td valign="top" width="50%">
															<xsl:apply-templates select="atb:Package/atb:CargoState"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:Package/atb:PackingMark or atb:Package/atb:PackageTypeCode or atb:Package/atb:PackingInfo">
													<xsl:if test="atb:Package/atb:PackingMark">
														<tr>
															<td valign="top" style="border-right:1px dashed">
																<xsl:text>Информация о маркировке:</xsl:text>
															</td>
															<td valign="top">
																<xsl:apply-templates select="atb:Package/atb:PackingMark"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="atb:Package/atb:PackageTypeCode">
														<tr>
															<td valign="top" style="border-right:1px dashed">
																<xsl:text>Упаковка товара:</xsl:text>
															</td>
															<td valign="top">
																<xsl:choose>
																	<xsl:when test="atb:Package/atb:PackageTypeCode='0'">без упаковки</xsl:when>
																	<xsl:when test="atb:Package/atb:PackageTypeCode='1'">с упаковкой</xsl:when>
																	<xsl:when test="atb:Package/atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
																</xsl:choose>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="atb:Package/atb:PackingInfo">
														<tr>
															<td valign="top" style="border-right:1px dashed">
																<xsl:text>Информация об упаковке:</xsl:text>
															</td>
															<td valign="top">
																<xsl:for-each select="atb:Package/atb:PackingInfo">
																	<xsl:apply-templates select="."/>
																	<xsl:if test="position()!=last()">, </xsl:if>
																</xsl:for-each>
															</td>
														</tr>
													</xsl:if>
												</xsl:if>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="littlebordered" align="center"><xsl:text>(отгрузочное наименование груза (для опасных грузов - в соответствии с ДОПОГ), его состояние и другая необходимая информация о грузе)</xsl:text></td>
									<td class="littlebordered" align="center"><xsl:text>(количество грузовых мест, маркировка, вид тары и способ упаковки)</xsl:text></td>
								</tr>
								<tr>
									<td colspan="2" class="bordered">
										<table>
											<tbody>
												<xsl:if test="atb:GrossWeightQuantity">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Масса груза брутто:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:GrossWeightQuantity"/>
															<xsl:text> кг</xsl:text>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:NetWeightQuantity">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Масса груза нетто:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:NetWeightQuantity"/>
															<xsl:text> кг</xsl:text>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:Sizes">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Размеры:</xsl:text>
														</td>
														<td valign="top">
															<xsl:text>Высота - </xsl:text>
															<xsl:apply-templates select="atb:Sizes/atb:Height"/>
															<xsl:text> м</xsl:text>
															<br/>
															<xsl:text>Ширина - </xsl:text>
															<xsl:apply-templates select="atb:Sizes/atb:Width"/>
															<xsl:text> м</xsl:text>
															<br/>
															<xsl:text>Длина - </xsl:text>
															<xsl:apply-templates select="atb:Sizes/atb:Length"/>
															<xsl:text> м</xsl:text>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:Capacity">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Объем груза:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:Capacity"/>
															<xsl:text> м</xsl:text><sup>3</sup>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:Density">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Плотность груза:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:Density"/>
															<xsl:text> кг/м</xsl:text><sup>3</sup>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:SupplementaryQuantity">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Дополнительные характеристики груза:</xsl:text>
														</td>
														<td valign="top">
															<table width="100%">
																<tbody>
																	<tr>
																		<td valign="top" style="border-right:1px dashed">
																			Количество в единице измерения
																		</td>
																		<td valign="top" style="border-right:1px dashed">
																			Условное обозначение единицы измерения
																		</td>
																		<td valign="top" style="border-right:1px dashed">
																			Код единицы измерения
																		</td>
																	</tr>
																	<xsl:for-each select="atb:SupplementaryQuantity">
																		<tr>
																			<td valign="top" style="border-right:1px dashed">
																				<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
																			</td>
																			<td valign="top" style="border-right:1px dashed">
																				<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
																			</td>
																			<td valign="top" style="border-right:1px dashed">
																				<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
																			</td>
																		</tr>
																	</xsl:for-each>
																</tbody>
															</table>
														</td>
													</tr>
												</xsl:if>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center" class="littlebordered">
										<xsl:text>(масса груза брутто в килограммах, масса груза нетто в килограммах (при возможности ее определения), размеры (высота, ширина, длина) в метрах (при перевозке крупногабаритного груза), объем груза в кубических метрах и плотность груза в соответствии с документацией на груз (при необходимости), дополнительные характеристики груза, учитывающие отраслевые особенности (при необходимости))</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="bordered">
									<xsl:if test="atb:Cargo/atb:DangerCargo">
										<table width="100%">
											<tbody>
												<tr>
													<td valign="top" style="border-right:1px dashed" width="50%">
														Информация об опасном грузе
													</td>
													<td valign="top" style="border-right:1px dashed" width="50%">
														Код класса опасности груза по МОПОГ/ДОПОГ
													</td>
												</tr>
												<xsl:for-each select="atb:Cargo/atb:DangerCargo">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:apply-templates select="atb:DangerCargoDescription"/>
														</td>
														<td valign="top" style="border-right:1px dashed">
															<xsl:apply-templates select="atb:HazardousCargoCode"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</xsl:if>
								</td>
								<td class="bordered" align="center">
									<xsl:if test="atb:ConsignorInstruction/atb:Cost">
										<xsl:apply-templates select="atb:ConsignorInstruction/atb:Cost/atb:TotalAmount"/>
										<xsl:if test="atb:ConsignorInstruction/atb:Cost/atb:CurrencyCode">
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="atb:ConsignorInstruction/atb:Cost/atb:CurrencyCode"/>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(в случае перевозки опасного груза - информация по каждому опасному веществу, материалу или изделию в соответствии с пунктом 5.4.1 ДОПОГ)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(объявленная стоимость (ценность) груза (при необходимости))</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>4. Сопроводительные документы на груз</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table width="100%">
										<tbody>
											<xsl:call-template name="DocsHead"/>
											<xsl:apply-templates select="atb:DocumentTN"/>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center"><xsl:text>(перечень прилагаемых к транспортной накладной документов, предусмотренных ДОПОГ, санитарными, таможенными (при наличии), карантинными, иными правилами в соответствии с законодательством Российской Федерации, либо регистрационные номера указанных документов, если такие документы (сведения о таких документах) содержатся в государственных информационных системах)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table width="100%">
										<tbody>
											<xsl:call-template name="DocsHead"/>
											<xsl:apply-templates select="atb:DocumentCargo"/>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center"><xsl:text>(перечень прилагаемых к грузу сертификатов, паспортов качества, удостоверений и других документов, наличие которых установлено законодательством Российской Федерации, либо регистрационные номера указанных документов, если такие документы (сведения о таких документах) содержатся в государственных информационных системах)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table width="100%">
										<tbody>
											<xsl:call-template name="DocsHead"/>
											<xsl:apply-templates select="atb:DocumentShipment"/>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать документ(-ы), подтверждающий(-ие) отгрузку товаров (при наличии), реквизиты сопроводительной ведомости (при перевозке груженых контейнеров или порожних контейнеров))</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>5. Указания грузоотправителя по особым условиям перевозки</b></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:if test="not(atb:ConsignorInstruction/atb:Route) and not(atb:ConsignorInstruction/atb:DeadlineTransport) and not(atb:ConsignorInstruction/atb:SpeedLimit)"><br/><br/></xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:Route">
										Установленный маршрут перевозки:<br/>
										<table>
											<tbody>
												<tr>
													<td align="center" valign="top" style="border-right:1px dashed">Откуда</td>
													<td align="center" valign="top" style="border-right:1px dashed">Куда</td>
													<td align="center" valign="top" style="border-right:1px dashed">Точка маршрута</td>
													<td align="center" valign="top">Комментарий</td>
												</tr>
												<xsl:for-each select="atb:ConsignorInstruction/atb:Route">
													<tr>
														<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
															<xsl:apply-templates select="atb:From"/>
														</td>
														<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
															<xsl:apply-templates select="atb:To"/>
														</td>
														<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
															<xsl:apply-templates select="atb:PointNumber"/>
														</td>
														<td valign="top" style="border-top:1px dashed">
															<xsl:apply-templates select="atb:Comment"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<xsl:if test="atb:ConsignorInstruction/atb:DeadlineTransport or atb:ConsignorInstruction/atb:SpeedLimit"><br/></xsl:if>
									</xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:DeadlineTransport">
										Рекомендуемый предельный срок перевозки: <xsl:apply-templates select="atb:ConsignorInstruction/atb:DeadlineTransport" mode="russian_date"/>
										<xsl:if test="atb:ConsignorInstruction/atb:SpeedLimit"><br/></xsl:if>
									</xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:SpeedLimit">
										Рекомендуемое ограничение скорости движения: <xsl:apply-templates select="atb:ConsignorInstruction/atb:SpeedLimit"/>
									</xsl:if>
								</td>
								<td class="bordered">
									<xsl:if test="not(atb:ConsignorInstruction/atb:PersonDirectReaddressing) and not(atb:ConsignorInstruction/atb:DirectReaddressing)"><br/><br/></xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:PersonDirectReaddressing">
										<xsl:apply-templates select="atb:PersonDirectReaddressing"/>
										<xsl:if test="atb:ConsignorInstruction/atb:DirectReaddressing"><br/></xsl:if>
									</xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:DirectReaddressing">
										Способы передачи указаний на переадресовку: <xsl:apply-templates select="atb:ConsignorInstruction/atb:DirectReaddressing"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(маршрут перевозки, дата и время/сроки доставки груза (при необходимости))</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(контактная информация о лицах, по указанию которых может осуществляться переадресовка)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:if test="not(atb:ConsignorInstruction/atb:PerformRequirements)"><br/><br/></xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:PerformRequirements">
										Указания, необходимые для фитосанитарных, санитарных, карантинных, таможенных и прочих требований: <br/>
										<xsl:for-each select="atb:ConsignorInstruction/atb:PerformRequirements">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:if>
								</td>
								<td class="bordered">
									<xsl:if test="not(atb:ConsignorInstruction/atb:Temperature) and not(atb:ConsignorInstruction/atb:Seal) and not(atb:ConsignorInstruction/atb:OverloadProhibition)"><br/><br/></xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:Temperature">
										Рекомендуемый температурный режим: <xsl:apply-templates select="atb:ConsignorInstruction/atb:Temperature"/>
										<xsl:if test="atb:ConsignorInstruction/atb:Seal or atb:ConsignorInstruction/atb:OverloadProhibition"><br/></xsl:if>
									</xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:Seal">
										Сведения о ЗПУ:
										<table>
											<tbody>
												<tr>
													<td align="center" valign="top" style="border-right:1px dashed">Номер</td>
													<td align="center" valign="top" style="border-right:1px dashed">Вид</td>
													<td align="center" valign="top" style="border-right:1px dashed">Количество</td>
													<td align="center" valign="top">Примечание</td>
												</tr>
												<xsl:for-each select="atb:ConsignorInstruction/atb:Seal">
													<tr>
														<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
															<xsl:apply-templates select="atb:IdentNumber"/>
														</td>
														<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
															<xsl:choose>
																<xsl:when test="atb:IdentKind='1'">пломба</xsl:when>
																<xsl:when test="atb:IdentKind='2'">печать</xsl:when>
																<xsl:when test="atb:IdentKind='3'">иное</xsl:when>
															</xsl:choose>
														</td>
														<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
															<xsl:apply-templates select="atb:Quantity"/>
														</td>
														<td valign="top" style="border-top:1px dashed">
															<xsl:apply-templates select="atb:IdentDesc"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<xsl:if test="atb:ConsignorInstruction/atb:OverloadProhibition"><br/></xsl:if>
									</xsl:if>
									<xsl:if test="atb:ConsignorInstruction/atb:OverloadProhibition">
										<xsl:text>Перегрузка: </xsl:text>
										<xsl:choose>
											<xsl:when test="atb:ConsignorInstruction/atb:OverloadProhibition='1' or atb:ConsignorInstruction/atb:OverloadProhibition='true'">запрещена</xsl:when>
											<xsl:when test="atb:ConsignorInstruction/atb:OverloadProhibition='0' or atb:ConsignorInstruction/atb:OverloadProhibition='false'">разрешена</xsl:when>
										</xsl:choose>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(указания, необходимые для выполнения фитосанитарных, санитарных, карантинных, таможенных и прочих требований, установленных законодательством Российской Федерации)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(температурный режим перевозки груза (при необходимости), сведения о запорно-пломбировочных устройствах (в случае их предоставления грузоотправителем), запрещение перегрузки груза)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>6. Перевозчик</b></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="atb:Carrier"/>
								</td>
								<td class="bordered">
									<xsl:if test="atb:Carrier/atb:Drivers">
										<xsl:for-each select="atb:Carrier/atb:Drivers">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать Перевозчика)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать водителя(-ей))</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>7. Транспортное средство</b></td>
							</tr>
							<xsl:for-each select="atb:Transport">
								<tr>
									<td class="bordered">
										<table width="100%">
											<tbody>
												<tr>
													<td width="25%" align="center" valign="top" style="border-right:1px dashed">Тип</td>
													<td width="25%" align="center" valign="top" style="border-right:1px dashed">Марка</td>
													<td width="25%" align="center" valign="top" style="border-right:1px dashed">Грузоподъемность, т.</td>
													<td width="25%" align="center" valign="top" style="border-right:1px dashed">Вместимость, м<sup>3</sup></td>
												</tr>
												<tr>
													<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="25%">
														<xsl:apply-templates select="atb:Kind"/>
													</td>
													<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="25%">
														<xsl:apply-templates select="atb:Mark"/>
													</td>
													<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="25%">
														<xsl:apply-templates select="atb:Tonnage"/>
													</td>
													<td valign="top" style="border-right:1px dashed;border-top:1px dashed" width="25%">
														<xsl:apply-templates select="atb:Capacity"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="bordered" align="center">
										<xsl:apply-templates select="atb:RegistrationNumber"/>
									</td>
								</tr>
								<tr>
									<td class="littlebordered" align="center"><xsl:text>(тип, марка, грузоподъемность (в тоннах), вместимость (в кубических метрах))</xsl:text></td>
									<td class="littlebordered" align="center"><xsl:text>(регистрационный номер транспортного средства)</xsl:text></td>
								</tr>
								<tr>
									<td colspan="2" class="bordered">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center">
													<xsl:text>Тип владения: 1 - собственность; 2 - совместная собственность супругов;</xsl:text>
													<br/>
													<xsl:text>3 - аренда; 4 - лизинг; 5 - безвозмездное пользование</xsl:text></td>
													<xsl:variable name="xpath_TypeOwnership">
														<xsl:call-template name="get_xpath">
															<xsl:with-param name="node" select="atb:TypeOwnership"/>
														</xsl:call-template>
													</xsl:variable>
													<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
														<element xml_node="{$xpath_TypeOwnership}">
															<xsl:choose>
																<xsl:when test="(number(atb:TypeOwnership)=1)">
																	<span class="graphBold">1</span>
																</xsl:when>
																<xsl:when test="(number(atb:TypeOwnership)=2)">
																	<span class="graphBold">2</span>
																</xsl:when>
																<xsl:when test="(number(atb:TypeOwnership)=3)">
																	<span class="graphBold">3</span>
																</xsl:when>
																<xsl:when test="(number(atb:TypeOwnership)=4)">
																	<span class="graphBold">4</span>
																</xsl:when>
																<xsl:when test="(number(atb:TypeOwnership)=5)">
																	<span class="graphBold">5</span>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</element>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:if test="atb:TypeOwnership=3 or atb:TypeOwnership=4 or atb:TypeOwnership=5">
											<xsl:apply-templates mode="document" select="atb:BasisOwnership"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="document" select="atb:SpecialPermission"/>
										<xsl:text> сроком действия до </xsl:text>
										<xsl:apply-templates select="atb:Validity"/>
										<xsl:if test="atb:HeavyOversized=1 or atb:DangerousCargo=1">
											<br/>Установленный маршрут перевозки:<br/>
											<table>
												<tbody>
													<tr>
														<td align="center" valign="top" style="border-right:1px dashed">Откуда</td>
														<td align="center" valign="top" style="border-right:1px dashed">Куда</td>
														<td align="center" valign="top" style="border-right:1px dashed">Точка маршрута</td>
														<td align="center" valign="top">Комментарий</td>
													</tr>
													<xsl:for-each select="atb:Route">
														<tr>
															<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																<xsl:apply-templates select="atb:From"/>
															</td>
															<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																<xsl:apply-templates select="atb:To"/>
															</td>
															<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																<xsl:apply-templates select="atb:PointNumber"/>
															</td>
															<td valign="top" style="border-top:1px dashed">
																<xsl:apply-templates select="atb:Comment"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="littlebordered" align="center"><xsl:text>(реквизиты документа(-ов), подтверждающего(-их) основание владения грузовым автомобилем (тягачом, а также прицепом (полуприцепом)) (для типов владения 3, 4, 5))</xsl:text></td>
									<td class="littlebordered" align="center"><xsl:text>(номер, дата и срок действия специального разрешения, установленный маршрут движения тяжеловесного и (или) крупногабаритного транспортного средства или транспортного средства, перевозящего опасный груз)</xsl:text></td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>8. Прием груза</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:choose>
										<xsl:when test="atb:LoadCargo/atb:Loading=0">
											<xsl:apply-templates select="atb:Consignor"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="atb:LoadCargo/atb:LoadingPerson"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center">
									<xsl:text>(реквизиты лица, осуществляющего погрузку груза в транспортное средство)</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:LoadCargo/atb:LoadingPointOwner"/><br/>
									<xsl:text>ИНН: </xsl:text>
									<xsl:apply-templates select="atb:LoadCargo/atb:LoadingPointOwner/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center">
									<xsl:text>(наименование (ИНН) владельца объекта инфраструктуры пункта погрузки)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="atb:LoadCargo/atb:Address"/>
								</td>
								<td class="bordered" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:LoadCargo/atb:DateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:LoadCargo/atb:DateTime, 12, 5)"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(адрес места погрузки)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(заявленные дата и время подачи транспортного средства под погрузку)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:LoadCargo/atb:ActualDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:LoadCargo/atb:ActualDateTime, 12, 5)"/>
								</td>
								<td class="bordered" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:LoadCargo/atb:ActualDepDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:LoadCargo/atb:ActualDepDateTime, 12, 5)"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(фактические дата и время прибытия под погрузку)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(фактические дата и время убытия)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<xsl:apply-templates select="atb:LoadCargo/atb:CargoWeight"/>
									<xsl:text> кг</xsl:text><br/>
									<xsl:text>Метод определения: </xsl:text>
									<xsl:choose>
										<xsl:when test="atb:LoadCargo/atb:CargoWeightCalculation=1">
											<xsl:text>определение разницы между массой транспортного средства после погрузки и перед погрузкой по общей массе</xsl:text>
										</xsl:when>
										<xsl:when test="atb:LoadCargo/atb:CargoWeightCalculation=2">
											<xsl:text>взвешивание поосно</xsl:text>
										</xsl:when>
										<xsl:when test="atb:LoadCargo/atb:CargoWeightCalculation=3">
											<xsl:text>расчетная масса груза</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>не указан</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center">
									<xsl:text>(масса груза брутто в килограммах и метод ее определения)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="atb:LoadCargo/atb:PlacesQuantity"/>
								</td>
								<td class="bordered">
									<xsl:for-each select="atb:LoadCargo/atb:ActualStateOfPackages/atb:PackingInfo">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(количество грузовых мест)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(тара, упаковка (при наличии))</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table>
										<tbody>
											<xsl:if test="atb:CarrierComments/atb:LoadActualArrDateTime">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Дата и время прибытия ТС на погрузку:</xsl:text>
													</td>
													<td valign="top">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="atb:CarrierComments/atb:LoadActualArrDateTime"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
														<xsl:value-of select="substring(atb:CarrierComments/atb:LoadActualArrDateTime, 12, 8)"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:LoadActualDepDateTime">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Дата и время убытия ТС с погрузки:</xsl:text>
													</td>
													<td valign="top">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="atb:CarrierComments/atb:LoadActualDepDateTime"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
														<xsl:value-of select="substring(atb:CarrierComments/atb:LoadActualDepDateTime, 12, 8)"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:ActualStateLoad/atb:CargoState">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Состояние груза:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:ActualStateLoad/atb:CargoState"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:Bracing">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Крепление груза:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:Bracing"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:ActualStateLoad/atb:PackingMark or atb:CarrierComments/atb:ActualStateLoad/atb:PackageTypeCode or atb:CarrierComments/atb:ActualStateLoad/atb:PackingInfo">
												<xsl:if test="atb:CarrierComments/atb:ActualStateLoad/atb:PackingMark">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Информация о маркировке:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:CarrierComments/atb:ActualStateLoad/atb:PackingMark"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:CarrierComments/atb:ActualStateLoad/atb:PackageTypeCode">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Упаковка товара:</xsl:text>
														</td>
														<td valign="top">
															<xsl:choose>
																<xsl:when test="atb:CarrierComments/atb:ActualStateLoad/atb:PackageTypeCode='0'">без упаковки</xsl:when>
																<xsl:when test="atb:CarrierComments/atb:ActualStateLoad/atb:PackageTypeCode='1'">с упаковкой</xsl:when>
																<xsl:when test="atb:CarrierComments/atb:ActualStateLoad/atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
															</xsl:choose>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:CarrierComments/atb:ActualStateLoad/atb:PackingInfo">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Информация об упаковке:</xsl:text>
														</td>
														<td valign="top">
															<xsl:for-each select="atb:CarrierComments/atb:ActualStateLoad/atb:PackingInfo">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:if>
<!--											<xsl:if test="atb:LoadCargo/atb:Seal">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Сведения о ЗПУ:</xsl:text>
													</td>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td align="center" valign="top" style="border-right:1px dashed">Номер</td>
																	<td align="center" valign="top" style="border-right:1px dashed">Вид</td>
																	<td align="center" valign="top" style="border-right:1px dashed">Количество</td>
																	<td align="center" valign="top">Примечание</td>
																</tr>
																<xsl:for-each select="atb:LoadCargo/atb:Seal">
																	<tr>
																		<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																			<xsl:apply-templates select="atb:IdentNumber"/>
																		</td>
																		<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																			<xsl:choose>
																				<xsl:when test="atb:IdentKind='1'">пломба</xsl:when>
																				<xsl:when test="atb:IdentKind='2'">печать</xsl:when>
																				<xsl:when test="atb:IdentKind='3'">иное</xsl:when>
																			</xsl:choose>
																		</td>
																		<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																			<xsl:apply-templates select="atb:Quantity"/>
																		</td>
																		<td valign="top" style="border-top:1px dashed">
																			<xsl:apply-templates select="atb:IdentDesc"/>
																		</td>
																	</tr>
																</xsl:for-each>
															</tbody>
														</table>
													</td>
												</tr>
											</xsl:if>-->
											<xsl:if test="atb:CarrierComments/atb:LoadBruttoCargoWeight">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Масса груза брутто при погрузке:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:LoadBruttoCargoWeight"/>
														<xsl:text> кг</xsl:text>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:LoadPlacesQuantity">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Количество грузовых мест:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:LoadPlacesQuantity"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:LoadingOperations">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Проведение погрузочных работ:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:LoadingOperations"/>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center">
									<xsl:text>(оговорки и замечания перевозчика (при наличии) о дате и времени прибытия/убытия, о состоянии, креплении груза, тары, упаковки, маркировки, опломбирования, о массе груза и количестве грузовых мест, о проведении погрузочных работ)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:LoadCargo/atb:Loading=0 or atb:LoadCargo/atb:Loading='false' or atb:LoadCargo/atb:Loading='f'">
											<xsl:if test="atb:LoadCargo/atb:PersonSign/atb:TypePerson=1">
												<xsl:apply-templates select="atb:LoadCargo/atb:PersonSign[atb:TypePerson=1]"/>
											</xsl:if>
										</xsl:when>
										<xsl:when test="atb:LoadCargo/atb:Loading='1' or atb:LoadCargo/atb:Loading='true' or atb:LoadCargo/atb:Loading='t'">
											<xsl:if test="atb:LoadCargo/atb:PersonSign/atb:TypePerson=3">
												<xsl:apply-templates select="atb:LoadCargo/atb:PersonSign[atb:TypePerson=3]"/>
											</xsl:if>
											<xsl:for-each select="atb:LoadCargo/atb:LoadingPersonDoc">
												<xsl:apply-templates mode="document" select="."/>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:LoadCargo/atb:PersonSign/atb:TypePerson=4">
											<xsl:apply-templates select="atb:LoadCargo/atb:PersonSign[atb:TypePerson=4]"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(подпись, расшифровка подписи лица, осуществившего погрузку груза, с указанием реквизитов документа, подтверждающего полномочия лица на погрузку груза)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(подпись, расшифровка подписи водителя, принявшего груз для перевозки)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>9. Переадресовка (при наличии)</b></td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:apply-templates select="atb:Readdressing/atb:DateReaddressing" mode="russian_date"/>
									<xsl:text> - </xsl:text>
									<xsl:choose>
										<xsl:when test="atb:Readdressing/atb:FormReaddressing='0' or atb:Readdressing/atb:FormReaddressing='false' or atb:Readdressing/atb:FormReaddressing='f'">устно</xsl:when>
										<xsl:when test="atb:Readdressing/atb:FormReaddressing='1' or atb:Readdressing/atb:FormReaddressing='true' or atb:Readdressing/atb:FormReaddressing='t'">письменно</xsl:when>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="atb:Readdressing/atb:Address"/>
									<br/>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:Readdressing/atb:DateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:Readdressing/atb:DateTime, 12, 8)"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(дата, вид переадресовки на бумажном носителе или в электронном виде (с указанием вида доставки документа))</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(адрес нового пункта выгрузки, новые дата и время подачи транспортного средства под выгрузку)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="atb:Readdressing/atb:PersonReaddressing"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="atb:Readdressing/atb:Consignee"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты лица, от которого получено указание на переадресовку)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(при изменении получателя груза - реквизиты нового получателя)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>10. Выдача груза</b></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="atb:UnloadCargo/atb:Address"/>
								</td>
								<td class="bordered" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:UnloadCargo/atb:DateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:UnloadCargo/atb:DateTime, 12, 8)"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(адрес места выгрузки)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(заявленные дата и время подачи транспортного средства под выгрузку)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:UnloadCargo/atb:ActualDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:UnloadCargo/atb:ActualDateTime, 12, 8)"/>
								</td>
								<td class="bordered" align="center">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="atb:UnloadCargo/atb:ActualDepDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(atb:UnloadCargo/atb:ActualDepDateTime, 12, 8)"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(фактические дата и время прибытия)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(фактические дата и время убытия)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<table>
										<tbody>
											<xsl:if test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:CargoState">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Состояние груза:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:UnloadCargo/atb:ActualStateOfPackages/atb:CargoState"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingMark or atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackageTypeCode or atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingInfo">
												<xsl:if test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingMark">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Информация о маркировке:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingMark"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackageTypeCode">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Упаковка товара:</xsl:text>
														</td>
														<td valign="top">
															<xsl:choose>
																<xsl:when test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackageTypeCode='0'">без упаковки</xsl:when>
																<xsl:when test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackageTypeCode='1'">с упаковкой</xsl:when>
																<xsl:when test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
															</xsl:choose>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingInfo">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Информация об упаковке:</xsl:text>
														</td>
														<td valign="top">
															<xsl:for-each select="atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingInfo">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:if>
											<xsl:if test="atb:UnloadCargo/atb:Seal">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Сведения о ЗПУ:</xsl:text>
													</td>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td align="center" valign="top" style="border-right:1px dashed">Номер</td>
																	<td align="center" valign="top" style="border-right:1px dashed">Вид</td>
																	<td align="center" valign="top" style="border-right:1px dashed">Количество</td>
																	<td align="center" valign="top">Примечание</td>
																</tr>
																<xsl:for-each select="atb:UnloadCargo/atb:Seal">
																	<tr>
																		<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																			<xsl:apply-templates select="atb:IdentNumber"/>
																		</td>
																		<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																			<xsl:choose>
																				<xsl:when test="atb:IdentKind='1'">пломба</xsl:when>
																				<xsl:when test="atb:IdentKind='2'">печать</xsl:when>
																				<xsl:when test="atb:IdentKind='3'">иное</xsl:when>
																			</xsl:choose>
																		</td>
																		<td valign="top" style="border-right:1px dashed;border-top:1px dashed">
																			<xsl:apply-templates select="atb:Quantity"/>
																		</td>
																		<td valign="top" style="border-top:1px dashed">
																			<xsl:apply-templates select="atb:IdentDesc"/>
																		</td>
																	</tr>
																</xsl:for-each>
															</tbody>
														</table>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
								<td class="bordered" align="center">
									<xsl:apply-templates select="atb:UnloadCargo/atb:PlacesQuantity"/>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(фактическое состояние груза, тары, упаковки, маркировки, опломбирования)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(количество грузовых мест)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<table>
										<tbody>
											<xsl:if test="atb:UnloadCargo/atb:CargoWeight">
												<tr>
													<td valign="top" style="border-right:1px dashed" width="50%">
														<xsl:text>Масса груза брутто при погрузке:</xsl:text>
													</td>
													<td valign="top" width="50%">
														<xsl:apply-templates select="atb:UnloadCargo/atb:CargoWeight"/>
														<xsl:text> кг</xsl:text>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:UnloadCargo/atb:NettoCargoWeight">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Масса груза нетто при погрузке:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:UnloadCargo/atb:NettoCargoWeight"/>
														<xsl:text> кг</xsl:text>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:UnloadCargo/atb:NettoCargoWeight">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Плотность груза в соответствии с документацией на груз:</xsl:text>
													</td>
													<td valign="top">
														<xsl:for-each select="atb:Cargo/atb:Density">
															<xsl:apply-templates select="."/>
															<xsl:text> кг/м</xsl:text><sup>3</sup>
															<xsl:if test="position()!=last()">, </xsl:if>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
								<td class="bordered">
									<table>
										<tbody>
											<xsl:if test="atb:CarrierComments/atb:UnloadActualArrDateTime">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Дата и время прибытия ТС на погрузку:</xsl:text>
													</td>
													<td valign="top">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="atb:CarrierComments/atb:UnloadActualArrDateTime"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
														<xsl:value-of select="substring(atb:CarrierComments/atb:UnloadActualArrDateTime, 12, 8)"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:UnloadActualDepDateTime">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Дата и время убытия ТС с погрузки:</xsl:text>
													</td>
													<td valign="top">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="atb:CarrierComments/atb:UnloadActualDepDateTime"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
														<xsl:value-of select="substring(atb:CarrierComments/atb:UnloadActualDepDateTime, 12, 8)"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:ActualStateUnload/atb:CargoState">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Состояние груза:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:ActualStateUnload/atb:CargoState"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:ActualStateUnload/atb:PackingMark or atb:CarrierComments/atb:ActualStateUnload/atb:PackageTypeCode or atb:CarrierComments/atb:ActualStateUnload/atb:PackingInfo">
												<xsl:if test="atb:CarrierComments/atb:ActualStateUnload/atb:PackingMark">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Информация о маркировке:</xsl:text>
														</td>
														<td valign="top">
															<xsl:apply-templates select="atb:CarrierComments/atb:ActualStateUnload/atb:PackingMark"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:CarrierComments/atb:ActualStateUnload/atb:PackageTypeCode">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Упаковка товара:</xsl:text>
														</td>
														<td valign="top">
															<xsl:choose>
																<xsl:when test="atb:CarrierComments/atb:ActualStateUnload/atb:PackageTypeCode='0'">без упаковки</xsl:when>
																<xsl:when test="atb:CarrierComments/atb:ActualStateUnload/atb:PackageTypeCode='1'">с упаковкой</xsl:when>
																<xsl:when test="atb:CarrierComments/atb:ActualStateUnload/atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
															</xsl:choose>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="atb:CarrierComments/atb:ActualStateUnload/atb:PackingInfo">
													<tr>
														<td valign="top" style="border-right:1px dashed">
															<xsl:text>Информация об упаковке:</xsl:text>
														</td>
														<td valign="top">
															<xsl:for-each select="atb:CarrierComments/atb:ActualStateUnload/atb:PackingInfo">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:UnloadBruttoCargoWeight">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Масса груза брутто при погрузке:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:UnloadBruttoCargoWeight"/>
														<xsl:text> кг</xsl:text>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="atb:CarrierComments/atb:UnloadPlacesQuantity">
												<tr>
													<td valign="top" style="border-right:1px dashed">
														<xsl:text>Количество грузовых мест:</xsl:text>
													</td>
													<td valign="top">
														<xsl:apply-templates select="atb:CarrierComments/atb:UnloadPlacesQuantity"/>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(масса груза брутто в килограммах, масса груза нетто в килограммах (при возможности ее определения), плотность груза в соответствии с документацией на груз (при необходимости))</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(оговорки и замечания перевозчика (при наличии) о дате и времени прибытия/убытия, о состоянии груза, тары, упаковки, маркировки, опломбирования, о массе груза и количестве грузовых мест)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:UnloadCargo/atb:PersonSign/atb:TypePerson=2">
											<xsl:apply-templates select="atb:UnloadCargo/atb:PersonSign[atb:TypePerson=2]"/>
										</xsl:when>
										<xsl:when test="atb:UnloadCargo/atb:PersonSign/atb:TypePerson=3">
											<xsl:apply-templates select="atb:UnloadCargo/atb:PersonSign[atb:TypePerson=3]"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:UnloadCargo/atb:PersonSign/atb:TypePerson=4">
											<xsl:apply-templates select="atb:UnloadCargo/atb:PersonSign[atb:TypePerson=4]"/>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(должность, подпись, расшифровка подписи грузополучателя или уполномоченного грузоотправителем лица)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(подпись, расшифровка подписи водителя, сдавшего груз грузополучателю или уполномоченному грузополучателем лицу)</xsl:text></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>11. Отметки грузоотправителей, грузополучателей, перевозчиков (при необходимости)</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table width="100%">
										<tbody>
											<xsl:for-each select="atb:Notes">
												<tr>
													<td width="50%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
														<xsl:apply-templates select="atb:DescriptionNote"/>
													</td>
													<td width="40%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
														<xsl:apply-templates select="atb:Calculation"/>
													</td>
													<td width="10%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
														<br/>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="atb:PersonSign/cat_ru:IssueDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
											<tr>
												<td class="littlebordered" align="center">
													<xsl:text>(краткое описание обстоятельств, послуживших основанием для отметки, сведения о коммерческих и иных актах, в том числе о погрузке/выгрузке груза)</xsl:text>
												</td>
												<td class="littlebordered" align="center">
													<xsl:text>(расчет и размер штрафа)</xsl:text>
												</td>
												<td class="littlebordered" align="center">
													<xsl:text>(подпись, дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center"><b>12. Стоимость перевозки груза (установленная плата) в рублях (при необходимости)</b></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td width="25%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
													<xsl:apply-templates select="atb:Calculation/atb:CostOfTheCarrierService"/>
												</td>
												<td width="25%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
													<xsl:apply-templates select="atb:Calculation/atb:TaxRate"/>
												</td>
												<td width="25%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
													<xsl:apply-templates select="atb:Calculation/atb:TaxSum"/>
												</td>
												<td width="25%" align="center" class="graph" style="border:solid 1pt #000000;" valign="middle">
													<xsl:apply-templates select="atb:Calculation/atb:TotalCost"/>
												</td>
											</tr>
											<tr>
												<td class="littlebordered" align="center">
													<xsl:text>(стоимость перевозки без налога - всего)</xsl:text>
												</td>
												<td class="littlebordered" align="center">
													<xsl:text>(налоговая ставка)</xsl:text>
												</td>
												<td class="littlebordered" align="center">
													<xsl:text>(сумма налога, предъявляемая покупателю)</xsl:text>
												</td>
												<td class="littlebordered" align="center">
													<xsl:text>(стоимость перевозки с налогом - всего)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bordered" align="center">
									<xsl:apply-templates select="atb:Calculation/atb:ProcedureCalculation"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="littlebordered" align="center">
									<xsl:text>(порядок (механизм) расчета (исчислений) платы) (при наличии порядка (механизма))</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='0'] or atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='true'] or atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='t']">
											<xsl:for-each select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='0']">
												<xsl:apply-templates select="./cat_ru:OrganizationName"/>
												<xsl:if test="not(./cat_ru:OrganizationName) and ./cat_ru:ShortName">
													<xsl:apply-templates select="./cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<br/>
													ИНН - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<br/>
													КПП - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='true']">
												<xsl:apply-templates select="./cat_ru:OrganizationName"/>
												<xsl:if test="not(./cat_ru:OrganizationName) and ./cat_ru:ShortName">
													<xsl:apply-templates select="./cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<br/>
													ИНН - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<br/>
													КПП - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='t']">
												<xsl:apply-templates select="./cat_ru:OrganizationName"/>
												<xsl:if test="not(./cat_ru:OrganizationName) and ./cat_ru:ShortName">
													<xsl:apply-templates select="./cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<br/>
													ИНН - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<br/>
													КПП - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='1'] or atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='false'] or atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='f']">
											<xsl:for-each select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='1']">
												<xsl:apply-templates select="./cat_ru:OrganizationName"/>
												<xsl:if test="not(./cat_ru:OrganizationName) and ./cat_ru:ShortName">
													<xsl:apply-templates select="./cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<br/>
													ИНН - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<br/>
													КПП - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='false']">
												<xsl:apply-templates select="./cat_ru:OrganizationName"/>
												<xsl:if test="not(./cat_ru:OrganizationName) and ./cat_ru:ShortName">
													<xsl:apply-templates select="./cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<br/>
													ИНН - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<br/>
													КПП - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</xsl:if>
											</xsl:for-each>
											<xsl:for-each select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='f']">
												<xsl:apply-templates select="./cat_ru:OrganizationName"/>
												<xsl:if test="not(./cat_ru:OrganizationName) and ./cat_ru:ShortName">
													<xsl:apply-templates select="./cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<br/>
													ИНН - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
												<xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<br/>
													КПП - <xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать Экономического субъекта, составляющего первичный учетный документ о факте хозяйственной жизни со стороны Перевозчика)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать Экономического субъекта, составляющего первичный учетный документ о факте хозяйственной жизни со стороны Грузоотправителя)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='0']">
											<xsl:apply-templates mode="document" select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='0']/atb:EconomicSubjectBaseDoc"/>
										</xsl:when>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='true']">
											<xsl:apply-templates mode="document" select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='true']/atb:EconomicSubjectBaseDoc"/>
										</xsl:when>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='t']">
											<xsl:apply-templates mode="document" select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='t']/atb:EconomicSubjectBaseDoc"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='1']">
											<xsl:apply-templates mode="document" select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='1']/atb:EconomicSubjectBaseDoc"/>
										</xsl:when>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='false']">
											<xsl:apply-templates mode="document" select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='false']/atb:EconomicSubjectBaseDoc"/>
										</xsl:when>
										<xsl:when test="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='f']">
											<xsl:apply-templates mode="document" select="atb:Calculation/atb:PrimaryAccDocSubject[atb:EconomicSubject='f']/atb:EconomicSubjectBaseDoc"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(основание, по которому Экономический субъект является составителем документа о факте хозяйственной жизни)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(основание, по которому Экономический субъект является составителем документа о факте хозяйственной жизни)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered" align="center">
									<xsl:text>-</xsl:text>
								</td>
								<td class="bordered">
									<xsl:if test="atb:Calculation/atb:Payer">
										<xsl:apply-templates select="atb:Calculation/atb:Payer"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center">&#160;&#160;&#160;&#160;&#160;</td>
								<td class="littlebordered" align="center"><xsl:text>(реквизиты, позволяющие идентифицировать лицо, от которого будут поступать денежные средства)</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PersonSign/atb:TypePerson=5">
											<xsl:apply-templates select="atb:Calculation/atb:PersonSign[atb:TypePerson=5]"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PersonSign/atb:TypePerson=1">
											<xsl:apply-templates select="atb:Calculation/atb:PersonSign[atb:TypePerson=1]"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(подпись, расшифровка подписи лица, ответственного за оформление факта хозяйственной жизни со стороны Перевозчика (уполномоченного лица))</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(подпись, расшифровка подписи лица, ответственного за оформление факта хозяйственной жизни со стороны Грузоотправителя (уполномоченного лица))</xsl:text></td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PersonSign/atb:TypePerson=5">
											<xsl:apply-templates select="atb:Calculation/atb:PersonSign[atb:TypePerson=5]/cat_ru:PersonPost"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered">
									<xsl:choose>
										<xsl:when test="atb:Calculation/atb:PersonSign/atb:TypePerson=1">
											<xsl:apply-templates select="atb:Calculation/atb:PersonSign[atb:TypePerson=1]/cat_ru:PersonPost"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="littlebordered" align="center"><xsl:text>(должность, основание полномочий физического лица, уполномоченного Перевозчиком (уполномоченным лицом), дата подписания)</xsl:text></td>
								<td class="littlebordered" align="center"><xsl:text>(должность, основание полномочий физического лица, уполномоченного Грузоотправителем (уполномоченным лицом), дата подписания)</xsl:text></td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- 1 Грузоотправитель, 1а Заказчик услуг по организации перевозки груза, 2 Грузополучатель, atb:PersonDirectReaddressing, atb:PersonReaddressing -->
	<xsl:template match="atb:Consignor | atb:Consignee | atb:PersonReaddressing | atb:Customer | atb:PersonDirectReaddressing | atb:LoadCargo/atb:LoadingPerson | atb:LoadCargo/atb:LoadingPointOwner | atb:Readdressing/atb:PersonReaddressing | atb:Readdressing/atb:Consignee">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="cat_ru:Address"/>
		<br/>
		<xsl:for-each select="cat_ru:Contact/cat_ru:Phone">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- 3 Наименование груза -->
	<xsl:template match="atb:Cargo">
		<b><xsl:value-of select="position()"/></b>
		<xsl:text>. </xsl:text>
		<xsl:for-each select="atb:CargoDescription">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<br/>
		<xsl:if test="atb:Package">
			Упаковка и маркировка:
			<table width="100%">
				<tbody>
					<tr>
						<td width="25%" valign="top" style="border-right:1px dashed">Код вида упаковки товара, количество упаковок</td>
						<td width="25%" valign="top" style="border-right:1px dashed">Фактическое состояние груза</td>
						<td width="25%" valign="top" style="border-right:1px dashed">Маркировка грузовых мест</td>
						<td width="25%" valign="top">Упаковка</td>
					</tr>
					<xsl:for-each select="atb:Package">
						<tr>
							<td width="25%" valign="top" style="border-right:1px dashed; border-top:1px dashed">
								<xsl:for-each select="atb:PackingInfo">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td width="25%" valign="top" style="border-right:1px dashed; border-top:1px dashed"><xsl:apply-templates select="atb:CargoState"/></td>
							<td width="25%" valign="top" style="border-right:1px dashed; border-top:1px dashed"><xsl:apply-templates select="atb:PackingMark"/></td>
							<td width="25%" valign="top" style="border-top:1px dashed">
								<xsl:variable name="xpath_PackageTypeCode">
									<xsl:call-template name="get_xpath">
										<xsl:with-param name="node" select="atb:PackageTypeCode"/>
									</xsl:call-template>
								</xsl:variable>
								<element xml_node="{$xpath_PackageTypeCode}">
									<xsl:choose>
										<xsl:when test="atb:PackageTypeCode='0'">без упаковки</xsl:when>
										<xsl:when test="atb:PackageTypeCode='1'">с упаковкой</xsl:when>
										<xsl:when test="atb:PackageTypeCode='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
									</xsl:choose>
								</element>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="atb:NetWeightQuantity">
			Вес нетто (кг): <xsl:apply-templates select="atb:NetWeightQuantity"/>
			<br/>
		</xsl:if>
		<xsl:if test="atb:GrossWeightQuantity">
			Вес брутто (кг): <xsl:apply-templates select="atb:GrossWeightQuantity"/>
			<br/>
		</xsl:if>
		<xsl:if test="atb:Capacity">
			Объем грузового места (куб.м): <xsl:apply-templates select="atb:Capacity"/>
			<br/>
		</xsl:if>
		<xsl:if test="atb:Sizes">
			Размеры (высота, ширина, длина м): 
			<xsl:for-each select="atb:Sizes/*">
				<xsl:apply-templates select="."/><xsl:if test="position()!=last()"> x </xsl:if>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="atb:DangerCargo">
			Опасные грузы:
			<table width="100%">
				<tbody>
					<tr>
						<td width="50%" valign="top" style="border-right:1px dashed">Информация</td>
						<td width="50%" valign="top">Код класса опасности</td>
					</tr>
					<xsl:for-each select="atb:DangerCargo">
						<tr>
							<td valign="top" style="border-right:1px dashed; border-top:1px dashed">
								<xsl:for-each select="atb:DangerCargoDescription"><xsl:apply-templates select="."/></xsl:for-each>
							</td>
							<td valign="top" style="border-top:1px dashed">
								<xsl:for-each select="atb:HazardousCargoCode">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="position()!=last()">
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- 4 Документы к накладной и к грузу -->
	<xsl:template name="DocsHead">
		<tr>
			<td width="20%" valign="top" style="border-right:1px dashed">Вид</td>
			<td width="20%" valign="top" style="border-right:1px dashed">Документ</td>
			<td width="20%" valign="top" style="border-right:1px dashed">ИНН составителя документа</td>
			<td width="20%" valign="top" style="border-right:1px dashed">Дата окончания действия</td>
			<td width="20%" valign="top">Организация</td>
		</tr>
	</xsl:template>
	<xsl:template match="atb:DocumentTN | atb:DocumentCargo | atb:DocumentShipment">
		<tr>
			<td width="20%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:apply-templates select="atb:DocumentModeCode"/>
			</td>
			<td width="20%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:apply-templates mode="document" select="."/>
			</td>
			<td width="20%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:apply-templates select="atb:INN"/>
			</td>
			<td width="20%" valign="top" style="border-right:1px dashed;border-top:1px dashed">
				<xsl:apply-templates select="atb:ExpirationDate" mode="russian_date"/>
			</td>
			<td width="20%" valign="top" style="border-top:1px dashed">
				<xsl:apply-templates select="atb:ReleaseOrganization"/>
			</td>
		</tr>
	</xsl:template>
	<!-- 5. Указания грузоотправителя -->
	<xsl:template match="atb:ConsignorInstruction">
		<xsl:if test="atb:Cost">
			Объявленная стоимость (ценность) груза: 
			<xsl:apply-templates select="atb:Cost/atb:TotalAmount"/>
			<xsl:if test="atb:Cost/atb:CurrencyCode">
				(<xsl:apply-templates select="atb:Cost/atb:CurrencyCode"/>)
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="atb:Containers">
			<br/>
			<xsl:text>Сведения о контейнерах</xsl:text><br/>
			<xsl:for-each select="atb:Containers">
				<!--xsl:value-of select="position()"/-->
				<xsl:text>Количество: </xsl:text>
				<xsl:apply-templates select="atb:ContainerQuantity"/>
				<xsl:text>, Номера (идентификаторы): </xsl:text>
				<xsl:for-each select="atb:ContainerIdentificator">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 6. Перевозчик -->
	<xsl:template match="atb:Carrier">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:apply-templates select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<br/>
			<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
		<xsl:if test="atb:ResponsiblePerson">
			<br/><br/>
			Данные уполномоченного лица:<br/>
			<xsl:apply-templates select="atb:ResponsiblePerson"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="atb:LoadCargo/atb:PersonSign[.] | atb:UnloadCargo/atb:PersonSign[.] | atb:Calculation/atb:PersonSign[.]">
		<table>
			<tbody>
				<tr>
					<td valign="top" style="border-right:1px solid;border-top:1px solid" width="25%">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
					<td valign="top" style="border-right:1px solid;border-top:1px solid" width="50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:variable name="xpath_PersonName">
							<xsl:call-template name="get_xpath">
								<xsl:with-param name="node" select="cat_ru:PersonName"/>
							</xsl:call-template>
						</xsl:variable>
						<element xml_node="{$xpath_PersonName}">
							<xsl:value-of select="concat(substring(cat_ru:PersonName, 1, 1), '.')"/>
						</element>
						<xsl:variable name="xpath_PersonMiddleName">
							<xsl:call-template name="get_xpath">
								<xsl:with-param name="node" select="atb:PersonSign/cat_ru:PersonMiddleName"/>
							</xsl:call-template>
						</xsl:variable>
						<element xml_node="{$xpath_PersonMiddleName}">
							<xsl:value-of select="concat(substring(cat_ru:PersonMiddleName, 1, 1), '.')"/>
						</element>
					</td>
					<td valign="top" style="border-top:1px solid" width="25%">
						<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="atb:Calculation/atb:Payer">
		<table>
			<tr>
				<td class="bordered" style="width:40%; border:1px dashed">Наименование плательщика</td>
				<td class="bordered" style="width:60%; border:1px dashed">
					<xsl:apply-templates select="catComFin_ru:Name"/>
				</td>
			</tr>
			<xsl:if test="catComFin_ru:CompanyID">
				<tr>
					<td class="bordered" style="width:40%; border:1px dashed">ИНН</td>
					<td class="bordered" style="width:60%; border:1px dashed">
						<xsl:apply-templates select="catComFin_ru:CompanyID"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="catComFin_ru:KPPCode">
				<tr>
					<td class="bordered" style="width:40%; border:1px dashed">КПП</td>
					<td class="bordered" style="width:60%; border:1px dashed">
						<xsl:apply-templates select="catComFin_ru:KPPCode"/>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td class="bordered" style="width:40%; border:1px dashed">Банковские реквизиты</td>
				<td class="bordered" style="width:60%; border:1px dashed">
					<xsl:apply-templates select="atb:PaymentRequisitions/catComFin_ru:BankName"/>
					<xsl:if test="atb:PaymentRequisitions/catComFin_ru:BICID">
						<br/>
						БИК - <xsl:apply-templates select="atb:PaymentRequisitions/catComFin_ru:BICID"/>
					</xsl:if>
					<xsl:if test="atb:PaymentRequisitions/catComFin_ru:SWIFTID">
						<br/>
						SWIFT - <xsl:apply-templates select="atb:PaymentRequisitions/catComFin_ru:SWIFTID"/>
					</xsl:if>
					<xsl:if test="atb:PaymentRequisitions/catComFin_ru:AccountNumeric">
						<br/>
						Кор. счет - <xsl:apply-templates select="atb:PaymentRequisitions/catComFin_ru:AccountNumeric"/>
					</xsl:if>
				</td>
			</tr>
			<xsl:if test="catComFin_ru:Phone">
				<tr>
					<td class="bordered" style="width:40%; border:1px dashed">Телефон</td>
					<td class="bordered" style="width:60%; border:1px dashed">
						<xsl:apply-templates select="catComFin_ru:Phone"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="atb:Calculation/atb:Payer/atb:PostalAddress">
				<tr>
					<td class="bordered" style="width:40%; border:1px dashed">КПП</td>
					<td class="bordered" style="width:60%; border:1px dashed">
						<xsl:apply-templates select="atb:Calculation/atb:Payer/atb:PostalAddress"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:PackagePalleteInformationType -->
	<xsl:template match="atb:Package/atb:PackingInfo | atb:CarrierComments/atb:ActualStateLoad/atb:PackingInfo | atb:LoadCargo/atb:ActualStateOfPackages/atb:PackingInfo | atb:UnloadCargo/atb:ActualStateOfPackages/atb:PackingInfo | atb:CarrierComments/atb:ActualStateUnload/atb:PackingInfo">
		<xsl:if test="catESAD_cu:InfoKindCode">
			<xsl:choose>
				<xsl:when test="catESAD_cu:InfoKindCode='0'">Упаковка: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='1'">Тара: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='2'">Груз: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='3'">Поддон: </xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='4'">Инд.упаковка: </xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="catESAD_cu:PalleteCode">
			<xsl:if test="catESAD_cu:InfoKindCode">
				<xsl:text> - </xsl:text>
			</xsl:if>	
			<xsl:text>код: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:PalleteQuantity">
			<xsl:if test="catESAD_cu:InfoKindCode or catESAD_cu:InfoKindCode">
				<xsl:text> - </xsl:text>
			</xsl:if>	
			<xsl:text>кол-во: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:CargoDescriptionText">
			<xsl:if test="catESAD_cu:InfoKindCode or catESAD_cu:InfoKindCode or catESAD_cu:PalleteQuantity">
				<xsl:text> - </xsl:text>
			</xsl:if>	
			<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
		</xsl:if>
	</xsl:template>
	<!-- Документ -->
	<xsl:template match="*" mode="document">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="cat_ru:Address | atb:Address | atb:PostalAddress | atb:DeliveryAddress | atb:LoadCargo/atb:Address | atb:Readdressing/atb:Address | atb:UnloadCargo/atb:Address | atb:Calculation/atb:Payer/atb:PostalAddress">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Документ, удостоверяющий личность -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Контакт -->
	<xsl:template match="cat_ru:Contact | atb:Contact | RUScat_ru:CommunicationDetails">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Лицо, ответственное за перевозку -->
	<xsl:template match="atb:ResponsiblePerson">
		<xsl:apply-templates select="cat_ru:PersonPost"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		<br/>
		<xsl:text>Контакты: </xsl:text>
		<xsl:apply-templates select="atb:Contact"/>
	</xsl:template>
	<!-- Водители -->
	<xsl:template match="atb:Carrier/atb:Drivers">
		<xsl:apply-templates select="cat_ru:PersonPost"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		<br/>
		<xsl:text>Контакты: </xsl:text>
		<xsl:apply-templates select="atb:Contact"/>
		<xsl:if test="atb:INN">
			<br/>
			<xsl:text>ИНН: </xsl:text>
			<xsl:apply-templates select="atb:INN"/>
		</xsl:if>
		<xsl:if test="atb:DriversLicense">
			<br/>
			<xsl:text>Реквизиты водительского удостоверения: </xsl:text>
			<xsl:apply-templates select="atb:DriversLicense/atb:Series"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="atb:DriversLicense/cat_ru:PrDocumentNumber"/>
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="atb:DriversLicense/cat_ru:PrDocumentDate"/>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='AutoBill']//*" priority="-1">
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
</xsl:stylesheet>
