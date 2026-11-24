<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 04.09.2023 г. N 784 "Об утверждении формы заявления о завершении действия таможенной процедуры свободной таможенной зоны (за исключением случаев завершения действия такой процедуры на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области) в отношении товаров, которые были израсходованы (потреблены) в соответствии с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза, формы решения таможенного органа о завершении действия такой таможенной процедуры и приобретении товарами статуса товаров Евразийского экономического союза и порядков их заполнения". Приложение №1-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:accg="urn:customs.ru:Information:ExchangeDocuments:STZ_AppCloseConsumedGoods:5.28.0">
	<!-- Шаблон для типа STZ_AppCloseConsumedGoodsType -->
	<xsl:template match="accg:STZ_AppCloseConsumedGoods">
		<xsl:param name="w" select="277"/>
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
                  .font10{
					  font-size: 9pt;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="49%">
									Отметка таможенного органа
									<table>
										<tbody>
											<tr valign="top">
												<td class="bordered">
													<xsl:text>Регистрационный № </xsl:text>
													<table>
														<tbody>
															<tr>
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td><br/></td>
																			</tr>
																			<tr align="center" valign="top">
																				<td style="font-size: 8pt; border-top: 1px solid black;">
																					<xsl:text>(код таможенного органа)</xsl:text>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td align="center" valign="top">
																	<xsl:text>/</xsl:text>
																</td>
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td><br/></td>
																			</tr>
																			<tr align="center" valign="top">
																				<td style="font-size: 8pt; border-top: 1px solid black;">
																					<xsl:text>(день, месяц, год)</xsl:text>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td align="center" valign="top">
																	<xsl:text>/</xsl:text>
																</td>
																<td align="center">
																	<table style="display: inline-block; width: 25mm;">
																		<tbody>
																			<tr>
																				<td><br/></td>
																			</tr>
																			<tr align="center" valign="top">
																				<td style="font-size: 8pt; border-top: 1px solid black;">
																					<xsl:text>(порядковый номер)</xsl:text>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td align="center" valign="top">
																	<xsl:text>/</xsl:text>
																</td>
																<td align="center" valign="top">
																	<xsl:text>ЗЗП</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="2%"></td>
								<td width="49%">
									<table>
										<tbody>
											<tr>
												<td>
													<xsl:text>В </xsl:text>
													<xsl:apply-templates select="accg:Customs"/>
												</td>
											</tr>
											<tr>
												<td align="center" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													(наименование таможенного органа (с указанием кода таможенного органа)
												</td>
											</tr>
											<tr>
												<td>
													<xsl:text>От </xsl:text>
													<xsl:apply-templates select="accg:Resident"/>
												</td>
											</tr>
											<tr>
												<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													(резидент (участник) собой экономической зоны (территории опережающиего развития, свободного порта Владивосток, Арктической зоны Российской Федерации), или участник свободной экономической зоны, или иное лицо, определенное правом Евразийского экономического союза (далее - Заявитель)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<xsl:text>Заявление</xsl:text><br/>
										о завершении таможенной процедуры свободной таможенной зоны (за исключением случаев завершения действия такой процедуры на территории Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области) в отношении товаров, которые были израсходованы (потреблены) в соответствии с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						<xsl:text>1. Прошу завершить действие таможенной процедуры свободной таможенной зоны в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны, которые были израсходованы (потреблены) в соответствии с подпунктом 5 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза</xsl:text><sup>1</sup>
						<xsl:text>, на основании подпункта 3 пункта 10 статьи 207 ТК ЕАЭС согласно представленным ниже сведениям на </xsl:text>
						<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black; text-align: center;">
							<xsl:apply-templates select="accg:SheetsNumber"/>
						</span>
						<xsl:text> л.</xsl:text>
					</p>
					<p style="text-indent: 5mm;">
						<xsl:text>2. Отчет о товарах, помещенных под таможенную процедуру свободной таможенной зоны, и товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, которые были потреблены в соответствии с подпунктом 5 пункта 1 статьи 205 ТК ЕАЭС.</xsl:text>
					</p>
					<br/>
					<br/>
					<div style="width: 100%">
						Таблица №1. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные (потребленные) при создании объекта недвижимости и являющиеся составной (неотъемлемой) частью такого объекта недвижимости
					</div>
					<xsl:for-each select="accg:PropertyCreateGoods">
						<xsl:if test="position() != 0"><br/></xsl:if>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" colspan="11">I. Объект недвижимости <xsl:apply-templates select="accg:Position"/></td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">Наименование объекта недвижимости (согласно выписке из Единого государственного реестра недвижимости)</td>
									<td class="bordered font10" rowspan="2">Место нахождения объекта недвижимости (адрес)</td>
									<td class="bordered font10" colspan="2">Сведения о технической документации (техническом паспорте, проектной документации), на основании которой осуществлялось строительство</td>
									<td class="bordered font10" colspan="2">Сведения о постановке объекта недвижимости на баланс Заявителя</td>
									<td class="bordered font10" colspan="2">Ввод объекта недвижимости в эксплуатацию</td>
									<td class="bordered font10" colspan="2">Сведения о праве собственности на объект недвижимости</td>
									<td class="bordered font10" rowspan="2">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
									<td class="bordered font10">наименование документа (номер, дата)</td>
									<td class="bordered font10">дата ввода</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
									<td class="bordered font10">10</td>
									<td class="bordered font10">11</td>
								</tr>
								<tr valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="accg:PropertyName"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:TechDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:TechDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:PropertyBalanceSheet">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:PropertyBalanceSheet">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:CommissioningDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:CommissioningDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="accg:CommissioningDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:OwnershipDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:OwnershipDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" style="border-top: 0px;" colspan="10">
										II. Товары, помещенные под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при создании объекта недвижимости
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование товара</td>
									<td class="bordered font10" rowspan="2">Классификацион- ный код по единой Товарной номенклатуре внешне- экономической деятельности Евразийского экономического союза<sup>2</sup><br/>(10 знаков)</td>
									<td class="bordered font10" rowspan="2">Регистрационный номер декларации на товары</td>
									<td class="bordered font10" rowspan="2">Номер товара</td>
									<td class="bordered font10" rowspan="2">Количество товара/ кг</td>
									<td class="bordered font10" rowspan="2">Количество товара/ дополнительная единица измерения количества</td>
									<td class="bordered font10" rowspan="2">Наименование составной (неотемлемой) части, при создании которой был потреблен товар</td>
									<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
									<td class="bordered font10">10</td>
								</tr>
								<xsl:for-each select="accg:PropertyGoodsSTZ">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:PropertyGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:PropertyGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
													<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:ComponentUseName"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="accg:PropertyProcessingGoods">
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="8">
											III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при создании объекта недвижимости
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование товара</td>
										<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
										<td class="bordered font10" rowspan="2">Количество товара/ единица измерения количества</td>
										<td class="bordered font10" rowspan="2">Сведения об операциях по переработке, совершаемых при изготовлении (получении) товара, указанного в графе 2</td>
										<td class="bordered font10" rowspan="2">Наименование составной (неотемлемой) части, при создании которой был потреблен товар</td>
										<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
									</tr>
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:ProcessingOperations"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:ComponentName"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
										</tr>
								</tbody>
							</table>
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, указанного в разделе III
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара</td>
										<td class="bordered font10">Количество товара/ кг</td>
										<td class="bordered font10">Количество товара/ дополнительная единица измерения количества</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
									<xsl:for-each select="accg:UsedGoods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
														<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<div style="width: 100%">
						Таблица №2. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные (потребленные) при эксплуатации (содержании) объекта недвижимости
					</div>
					<xsl:for-each select="accg:PropertyExplGoods">
						<xsl:if test="position() != 0"><br/></xsl:if>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" colspan="7">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование объекта недвижимости (согласно выписке из Единого государственного реестра недвижимости)</td>
									<td class="bordered font10" rowspan="2">Место нахождения объекта недвижимости (адрес)</td>
									<td class="bordered font10" colspan="2">Сведения документах, подтверждающих право собственности  на объект недвижимости</td>
									<td class="bordered font10" rowspan="2">Вид работ по содержанию (эксплуатации), при совершении которых были потреблены товары</td>
									<td class="bordered font10" rowspan="2">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
								</tr>
								<tr valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:PropertyName"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:OwnershipDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:OwnershipDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:TypeOfWork"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" style="border-top: 0px;" colspan="11">
										II. Товары, помещенные под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при эксплуатации (содержании) объекта недвижимости
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование товара</td>
									<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
									<td class="bordered font10" rowspan="2">Регистрационный номер декларации на товары</td>
									<td class="bordered font10" rowspan="2">Номер товара</td>
									<td class="bordered font10" rowspan="2">Количество товара/ кг</td>
									<td class="bordered font10" rowspan="2">Количество товара/ дополнительная единица измерения количества</td>
									<td class="bordered font10" colspan="2">Сведения о документах, регламентирующих выполнение работ и нормативных затрат при эксплуатации (содержании) объекта недвижимости</td>
									<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
									<td class="bordered font10">10</td>
									<td class="bordered font10">11</td>
								</tr>
								<xsl:for-each select="accg:ExploitationGoodsSTZ">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:ExploitationGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:ExploitationGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
													<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:RegulatingDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="accg:ExploitationProcessingGoods">
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="9">
											III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при эксплуатации (содержании) объекта недвижимости
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование товара</td>
										<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
										<td class="bordered font10" rowspan="2">Количество товара/ единица измерения количества</td>
										<td class="bordered font10" rowspan="2">Сведения об операциях по переработке, совершаемых при изготовлении (получении) товара, указанного в графе 2</td>
										<td class="bordered font10" colspan="2">Сведения о документах, регламентирующих выполнение работ и нормативные затраты при эксплуатации (содержании) объекта недвижимости</td>
										<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
										<td class="bordered font10">9</td>
									</tr>
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:ProcessingOperations"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:OperatingOperations">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:OperatingOperations">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
										</tr>
								</tbody>
							</table>
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr>
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, изготовленного и потребленного при эксплуатации (содержании) объекта недвижимости, сведения о которых указаны в разделe III
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара</td>
										<td class="bordered font10">Количество товара/ кг</td>
										<td class="bordered font10">Количество товара/ дополнительная единица измерения количества</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
									<xsl:for-each select="accg:UsedGoods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
														<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<div style="width: 100%">
						Таблица №3. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные (потребленные) при ремонте (реконструкции) объекта недвижимости
					</div>
					<xsl:for-each select="accg:PropertyRepairGoods">
						<xsl:if test="position() != 0"><br/></xsl:if>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" colspan="9">I. Объект недвижимости</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование объекта недвижимости (согласно выписке из Единого государственного реестра недвижимости)</td>
									<td class="bordered font10" rowspan="2">Место нахождения объекта недвижимости (адрес)</td>
									<td class="bordered font10" rowspan="2">Сведения об операции по ремонту (реконструкции) объекта недвижимости, при совершении которой были потреблены товары</td>
									<td class="bordered font10" colspan="2">Сведения о технической документации</td>
									<td class="bordered font10" colspan="2">Сведения о документах, свидтельствующих о приеме-сдаче отремонтированного (реконструированного) объекта недвижимости</td>
									<td class="bordered font10" rowspan="2">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
								</tr>
								<tr valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:PropertyName"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:PropertyLocation" mode="address"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:ProcessingOperations"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:TechDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:TechDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:AcceptanceWork">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:AcceptanceWork">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" style="border-top: 0px;" colspan="9">
										II. Товары, помещенные под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при ремонте (реконструкции) объекта недвижимости
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование товара</td>
									<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
									<td class="bordered font10" rowspan="2">Регистрационный номер декларации на товары</td>
									<td class="bordered font10" rowspan="2">Номер товара</td>
									<td class="bordered font10" rowspan="2">Количество товара/ кг</td>
									<td class="bordered font10" rowspan="2">Количество товара/ дополнительная единица измерения количества</td>
									<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
								</tr>
								<xsl:for-each select="accg:RepairGoodsSTZ">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:RepairGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:RepairGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
													<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="accg:RepairProceccingGoods">
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при ремонте (реконструкции) объекта недвижимости
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование товара</td>
										<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
										<td class="bordered font10" rowspan="2">Количество товара/ единица измерения количества</td>
										<td class="bordered font10" rowspan="2">Сведения об операциях по переработке, совершаемых при изготовлении (получении) товара, указанного в графе 2</td>
										<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:ProcessingOperations"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
										</tr>
								</tbody>
							</table>
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr>
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, изготовленного и потребленного при эксплуатации (содержании) объекта недвижимости, сведения о которых указаны в разделe III
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара</td>
										<td class="bordered font10">Количество товара/ кг</td>
										<td class="bordered font10">Количество товара/ дополнительная единица измерения количества</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
									<xsl:for-each select="accg:UsedGoods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
														<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<div style="width: 100%">
						Таблица №4. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные (потребленные) при эксплуатации и (или) техническом обслуживании оборудования, машин и агрегатов, помещенных под таможенную процедуру свободной таможенной зоны и используемых Заявителем
					</div>
					<xsl:for-each select="accg:EquipmentExplGoods">
						<xsl:if test="position() != 0"><br/></xsl:if>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" colspan="11">I. Оборудование (машина, агрегат), помещенное под таможенную процедуру свободной таможенной зоны</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование оборудования</td>
									<td class="bordered font10" rowspan="2">Регистрационный номер декларации на товары</td>
									<td class="bordered font10" rowspan="2">Номер товара</td>
									<td class="bordered font10" rowspan="2">Количество товара / единица измерения</td>
									<td class="bordered font10" colspan="2">Сведения постановке оборудования на баланс</td>
									<td class="bordered font10" colspan="2">Сведения о документах, свидтельствующих о вводе оборудования в эксплуатацию</td>
									<td class="bordered font10" rowspan="2">Дата ввода</td>
									<td class="bordered font10" rowspan="2">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
									<td class="bordered font10">10</td>
									<td class="bordered font10">11</td>
								</tr>
								<xsl:for-each select="accg:EquipmentType">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:EquipmentName"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:EquipmentGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:EquipmentGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
													<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:PropertyBalanceSheet">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:PropertyBalanceSheet">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:CommissioningDetails">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:CommissioningDetails">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:CommissioningDetails">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="accg:CommissioningDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Comment"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" style="border-top: 0px;" colspan="12">
										II. Товары, помещенные под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при эксплуатации и (или) техническом обслуживании оборудования (машины, агрегата) 
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование товара</td>
									<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
									<td class="bordered font10" rowspan="2">Регистрационный номер декларации на товары</td>
									<td class="bordered font10" rowspan="2">Номер товара</td>
									<td class="bordered font10" rowspan="2">Количество товара/ кг</td>
									<td class="bordered font10" rowspan="2">Количество товара/ дополнительная единица измерения количества</td>
									<td class="bordered font10" colspan="3">Сведения об операции по эксплуатации и техническому обслуживанию оборудования</td>
									<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование операции</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
									<td class="bordered font10">10</td>
									<td class="bordered font10">11</td>
									<td class="bordered font10">12</td>
								</tr>
								<xsl:for-each select="accg:EquipmentGoodsSTZ">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:EquipmentGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:EquipmentGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
													<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:OperationsDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="accg:OperationsDescription"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:OperationsDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:OperationsDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="accg:EquipmentProcessingGoods">
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="10">
											III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при эксплуатации и (или) техническом обслуживании оборудования (машины, агрегата)
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование товара</td>
										<td class="bordered font10" rowspan="2">Классификацион- ный код товара</td>
										<td class="bordered font10" rowspan="2">Количество товара/ единица измерения количества</td>
										<td class="bordered font10" rowspan="2">Сведения об операциях по переработке, совершаемых при изготовлении (получении) товара, указанного в графе 2</td>
										<td class="bordered font10" colspan="3">Сведения об операции по эксплуатации и техническому обслуживанию оборудования, при совершении которой потреблены товары</td>
										<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">наименование операции</td>
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
										<td class="bordered font10">9</td>
										<td class="bordered font10">10</td>
									</tr>
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:ProcessingOperations"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:OperatingOperations">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="accg:OperationsDescription"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:OperatingOperations">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:OperatingOperations">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
										</tr>
								</tbody>
							</table>
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr>
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, изготовленного и потребленного при эксплуатации и (или) техническом обслуживании оборудования (машины, агрегата)
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара</td>
										<td class="bordered font10">Количество товара/ кг</td>
										<td class="bordered font10">Количество товара/ дополнительная единица измерения количества</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
									<xsl:for-each select="accg:UsedGoods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
														<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<div style="width: 100%">
						Таблица №5. Товары, помещенные под таможенную процедуру свободной таможенной зоны, и товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные (потребленные) при проведении исследований, испытаний, тестирований, проверок, опытов или экспериментов
					</div>
					<xsl:for-each select="accg:ResearchGoods">
						<xsl:if test="position() != 0"><br/></xsl:if>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" colspan="6">I. Сведения о проведенном исследовании</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Описание проведенной работы (исследования, испытания, тестирования, проверки, опыта, эксперимента)</td>
									<td class="bordered font10" colspan="2">Сведения о документах, регламентирующих проведение работ</td>
									<td class="bordered font10" rowspan="2">Срок проведения работ</td>
									<td class="bordered font10" rowspan="2">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
								</tr>
								<tr valign="top">
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:ResearchInfo"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:ReglamentDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="accg:ReglamentDoc">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:ResearchTerm" mode="russian_date"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Comment"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table style="margin: 0; table-layout: fixed; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="bordered font10" style="border-top: 0px;" colspan="9">
										II. Товары, помещенные под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при проведении исследования (испытания, тестирования, проверки, опыта, эксперимента)
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered font10" rowspan="2">№ п/п</td>
									<td class="bordered font10" rowspan="2">Наименование товара</td>
									<td class="bordered font10" rowspan="2">Классификационный код товара</td>
									<td class="bordered font10" rowspan="2">Регистрационный номер декларации на товары</td>
									<td class="bordered font10" rowspan="2">Номер товара</td>
									<td class="bordered font10" rowspan="2">Количество товара/ кг</td>
									<td class="bordered font10" rowspan="2">Количество товара/ дополнительная единица измерения количества</td>
									<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
								</tr>
								<tr align="center">
									<td class="bordered font10">наименование документа</td>
									<td class="bordered font10">номер, дата</td>
								</tr>
								<tr>
									<td class="bordered font10">1</td>
									<td class="bordered font10">2</td>
									<td class="bordered font10">3</td>
									<td class="bordered font10">4</td>
									<td class="bordered font10">5</td>
									<td class="bordered font10">6</td>
									<td class="bordered font10">7</td>
									<td class="bordered font10">8</td>
									<td class="bordered font10">9</td>
								</tr>
								<xsl:for-each select="accg:ResearchGoodsSTZ">
									<tr valign="top">
										<td class="bordered font10">
											<xsl:apply-templates select="accg:Position"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsDescription"/>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:ResearchGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:ResearchGoodsDecl">
												<xsl:if test="position()!= 1"><br/></xsl:if>
												<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
													<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:GoodsQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											</xsl:for-each>
										</td>
										<td class="bordered font10">
											<xsl:for-each select="accg:AccountDoc">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="accg:ResearchProcessingGoods">
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											III. Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, израсходованные и потребленные при проведении исследования (испытания, тестирования, проверки, опыта, эксперимента) 
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование товара</td>
										<td class="bordered font10" rowspan="2">Классификационный код товара</td>
										<td class="bordered font10" rowspan="2">Количество товара/ единица измерения количества</td>
										<td class="bordered font10" rowspan="2">Сведения об операциях по переработке, совершаемых при изготовлении (получении) товара, указанного в графе 2</td>
										<td class="bordered font10" colspan="2">Сведения о документах бухгалтерского учета</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">наименование документа</td>
										<td class="bordered font10">номер, дата</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:ProcessingOperations"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:AccountDoc">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
										</tr>
								</tbody>
							</table>
							<table style="margin: 0; table-layout: fixed; width: 100%;">
								<tbody>
									<tr>
										<td class="bordered font10" style="border-top: 0px;" colspan="7">
											IV. Товары, помещенные под таможенную процедуру свободной таможенной зоны и использованные при изготовлении товара, изготовленного и потребленного при проведении исследования (испытания, тестирования, проверки, опыта, эксперимента), сведения о котором указаны в разделе III
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара</td>
										<td class="bordered font10">Количество товара/ кг</td>
										<td class="bordered font10">Количество товара/ дополнительная единица измерения количества</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
									</tr>
									<xsl:for-each select="accg:UsedGoods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="accg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:apply-templates select="accg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsDecl">
													<xsl:if test="position()!= 1"><br/></xsl:if>
													<xsl:for-each select="accg:GoodsDeclnfo/accg:GoodsNumber">
														<xsl:if test="position() !=1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="accg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="accg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:for-each>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						<xsl:text>3. Отчетность о товарах, помещенных под таможенную процедуру свободной таможенной зоны, и товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, и совершаемых с ними операциях с </xsl:text>
						<xsl:apply-templates select="accg:StartReportDate" mode="russian_date"/>
						<xsl:text> по </xsl:text>
						<xsl:apply-templates select="accg:EndReportDate" mode="russian_date"/>
						<xsl:text> представлена</xsl:text>
					</p>
					<br/>
					<p style="text-indent: 5mm;">4. Опись представленных документов</p>
					<table style="table-layout: fixed; width: 200mm;">
						<tbody>
							<tr align="center">
								<td class="bordered font10">№ п/п</td>
								<td class="bordered font10">Наименование документа</td>
								<td class="bordered font10">Номер и дата документа</td>
								<td class="bordered font10">Количество листов</td>
							</tr>
							<xsl:for-each select="accg:PresentedDoc">
								<tr>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:Position"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="." mode="doc"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="accg:SheetsNumber"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table style="table-layout: fixed; width: 200mm;">
						<tbody>
							<tr>
								<td width="40%" align="center">
									<xsl:apply-templates select="accg:ResidentSignature"/>
								</td>
								<td width="5%"></td>
								<td width="30%" align="center">
									<xsl:apply-templates select="accg:ConfirmDoc" mode="doc"/>
								</td>
								<td width="5%"></td>
								<td width="20%"></td>
							</tr>
							<tr align="center">
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(фамилия, имя, отчество (при наличии), должность лица, подающего заявление
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(сведения о документе, подтверждающем полномочия лица)
								</td>
								<td></td>
								<td style="font-size: 8pt; border-top: 1px solid black;">
									(подпись)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="accg:ResidentSignature">
		<xsl:for-each select="*[local-name() != 'IssueDate' and local-name() != 'PersonPost']">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'PersonPost']">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="accg:Resident|accg:AuthorizedPerson">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРНИП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identityCard"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- ЮЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="accg:ResidentCertificate"/>
	</xsl:template>
	<xsl:template match="accg:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="accg:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="accg:CertificateDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="identityCard">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:if test="position() != 1">; </xsl:if>
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template match="accg:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
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
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='STZ_AppCloseConsumedGoods']//*" priority="-1">
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
