<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 08.02.2019 г. № 225 "Об утверждении Административного регламента Федеральной таможенной службы по предоставлению государственной услуги по ведению реестра таможенных перевозчиков"
Приложение 1 - (ApplicationType = ВК) - Заявление о включении в реестр таможенных перевозчиков
Приложение 3 - (ApplicationType = ИЗ) - Заявление о внесении изменений в реестр таможенных перевозчиков
Приложение 4 - (ApplicationType = ИС) - Заявление об исключении таможенного перевозчика из реестра таможенных перевозчиков
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RegCC="urn:customs.ru:Information:RegistrationDocuments:ApplicationCustomsCarrierRegistry:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
	<!-- Шаблон для типа ApplicationCustomsCarrierRegistryType -->
	<xsl:template match="RegCC:ApplicationCustomsCarrierRegistry">
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
					width: 180mm;
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
                  vertical-align:bottom;
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

					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }
                  

				.delim_3 {
				height: 3pt;
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
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Заявление</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="RegCC:ApplicationType='ВК'">
													<xsl:text>о включении в реестр таможенных перевозчиков</xsl:text>
												</xsl:when>
												<xsl:when test="RegCC:ApplicationType='ИЗ'">
													<xsl:text>о внесении изменений в реестр таможенных перевозчиков</xsl:text>
												</xsl:when>
												<xsl:when test="RegCC:ApplicationType='ИС'">
													<xsl:text>об исключении таможенного перевозчика из реестра таможенных перевозчиков</xsl:text>
												</xsl:when>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td align="right" width="40%"/>
												<td align="right" width="15%">
													<xsl:text>Руководителю</xsl:text>
												</td>
												<td align="center" width="35%" class="value">
													<xsl:apply-templates select="RegCC:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="graphLittle">
													<xsl:text>(наименование таможенного органа)</xsl:text>
												</td>
											</tr>
											<tr>
												<td/>
												<td colspan="2" class="value" align="center">
													<xsl:apply-templates select="RegCC:CustomsPerson" mode="PersonBase"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td colspan="2" class="graphLittle">
													<xsl:text>(инициалы, фамилия)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td>
													<xsl:call-template name="Date">
														<xsl:with-param select="RegCC:ApplicationDate" name="date"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="graphLittle">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates mode="organizationBase" select="RegCC:AppOrganizationInfo"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:text>(полное наименование юридического лица с указанием организационно-правовой формы)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<xsl:choose>
								<xsl:when test="RegCC:ApplicationType='ВК'">
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td width="60%">
															<xsl:text>просит рассмотреть возможность включения</xsl:text>
														</td>
														<td align="center" class="value" width="40%">
															<xsl:value-of select="RegCC:AppOrganizationInfo/cat_ru:ShortName"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="graphLittle">
															<xsl:text>(краткое наименование юридического лица)</xsl:text>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<xsl:text>в реестр таможенных перевозчиков.</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<b>
												<xsl:text>Сведения о заявителе</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td width="5%"/>
														<td width="5%"/>
														<td width="5%"/>
														<td width="10%"/>
														<td width="10%"/>
														<td width="15%"/>
														<td width="20%"/>
														<td width="30%"/>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="8">
															<xsl:text> I. Общие сведения о Заявителе</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>1</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Полное наименование юридического лица</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:value-of select="RegCC:AppOrganizationInfo/cat_ru:OrganizationName"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>2</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Сокращенное наименование юридического лица (при наличии)</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:value-of select="RegCC:AppOrganizationInfo/cat_ru:ShortName"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>3</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Организационно-правовая форма юридического лица</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:value-of select="RegCC:AppOrganizationInfo/RegCC:AppOrganizationOPF"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>4</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Место нахождения юридического лица (адрес), почтовый адрес</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:if test="RegCC:AppOrganizationInfo/cat_ru:Address">
																<xsl:apply-templates mode="addressStr" select="RegCC:AppOrganizationInfo/cat_ru:Address"/>
																<xsl:if test="RegCC:AppOrganizationInfo/RegCC:AddressPost">
																	<xsl:text>;</xsl:text>
																</xsl:if>
															</xsl:if>
															<br>
																<xsl:apply-templates mode="addressStr" select="RegCC:AppOrganizationInfo/RegCC:AddressPost"/>
															</br>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>5</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Средства связи (адрес электронной почты, телефон), сайт информационно-телекоммуникационной сети "Интернет"</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:apply-templates mode="Contact" select="RegCC:AppOrganizationInfo/cat_ru:Contact"/>
															<xsl:if test="RegCC:AppOrganizationInfo/RegCC:OrganizationURL">
																<br>
																	<xsl:text> cайт: </xsl:text>
																	<xsl:value-of select="RegCC:AppOrganizationInfo//RegCC:OrganizationURL"/>
																</br>
															</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="8">
															<xsl:text> II. Сведения о банковских счетах</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>6</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Открытые банковские счета</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:for-each select="RegCC:BankAccountInfo">
																<xsl:apply-templates select="." mode="bankInfo"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>;</xsl:text>
																	<br/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="8">
															<xsl:text> III. Сведения об осуществлении деятельности по перевозке грузов</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>7</xsl:text>
														</td>
														<td class="bordered" colspan="5">
															<xsl:text>Срок осуществления деятельности по перевозке грузов</xsl:text>
														</td>
														<td class="bordered" colspan="2">
															<xsl:value-of select="RegCC:ActivityDuration"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="8">
															<xsl:text> IV. Сведения об обеспечении исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>8</xsl:text>
														</td>
														<td class="bordered" colspan="4">
															<xsl:text>Общая сумма обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
														</td>
														<td class="bordered" colspan="3">
															<xsl:value-of select="RegCC:CollateralInfo/RegCC:CollateralAmount"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>9</xsl:text>
														</td>
														<td class="bordered" colspan="4">
															<xsl:text>Способ (способы) обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, номера и даты документов, подтверждающих обеспечение исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
														</td>
														<td class="bordered" colspan="3">
															<xsl:for-each select="RegCC:CollateralInfo/RegCC:CollateralMeans">
																<xsl:if test="RegCC:CollMoneyDocAmount">
																	<xsl:text> Внесение денежных средств (денег) на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegCC:CollMoneyDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegCC:CollBankGuaranteeDocAmount">
																	<xsl:text> Банковская гарантия на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegCC:CollBankGuaranteeDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegCC:CollGuaranteeDocAmount">
																	<xsl:text> Поручительство на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegCC:CollGuaranteeDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegCC:CollPropertyPawningDocAmount">
																	<xsl:text> Залог имущества на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegCC:CollPropertyPawningDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegCC:CollOtherDocAmount">
																	<xsl:for-each select="RegCC:CollOtherDocAmount">
																		<xsl:text> Обеспечение исполнения обязанности иным способом на сумму, эквивалентную сумме в евро: </xsl:text>
																		<xsl:value-of select="RegCC:CollOther"/>
																		<xsl:text>: </xsl:text>
																		<xsl:apply-templates select="RegCC:DocAmount" mode="CollateralDocument"/>
																	</xsl:for-each>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td align="center" class="bordered" colspan="8">
															<xsl:text>VI. Сведения о находящихся в собственности, хозяйственном ведении, оперативном управлении, аренде транспортных средствах (далее - т/с)</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered">
															<xsl:text>10</xsl:text>
														</td>
														<td align="center" class="bordered" colspan="7">
															<xsl:text>Вид транспорта</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" rowspan="2">
															<xsl:text>11</xsl:text>
														</td>
														<td class="bordered" align="center" colspan="7">
															<xsl:text>Общее количество т/с, технические характеристики</xsl:text>
														</td>
													</tr>
													<tr align="center">
														<td class="bordered">
															<xsl:text>1</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>2</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>3</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>4</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>5</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>6</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>7</xsl:text>
														</td>
													</tr>
													<tr align="center">
														<td class="bordered">
															<xsl:text>12</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Тип т/с</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Марка т/с</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Номер шасси т/с</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Государст-
																венный 
																регистра-
																ционный 
																номер т/с</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Наименование 
                                                            собственника т/с</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Наименование арендодателя, субарендо-
                                                               дателя т/с</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Номер свидетельства о допущении т/с к перевозкам под таможенными печатями и пломбами, дата окончания срока его действия</xsl:text>
														</td>
													</tr>
													<xsl:for-each select="RegCC:TransportInfo/RegCC:TransportUnitInfo">
														<tr>
															<td class="bordered">
																<xsl:value-of select="position()"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:TransportKindCode"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:TransportMarkCode"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:VIN"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="cat_ru:TransportIdentifier"/>
																<xsl:if test="cat_ru:TransportMeansNationalityCode">
																	<xsl:text> (</xsl:text>
																	<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="RegCC:OwnerVehicle" mode="organizationBase"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="RegCC:LessorVehicle" mode="organizationBase"/>
															</td>
															<td class="bordered">
																<xsl:if test="RegCC:UseSealDocument/cat_ru:PrDocumentNumber">
																	<xsl:text> № </xsl:text>
																	<xsl:value-of select="RegCC:UseSealDocument/cat_ru:PrDocumentNumber"/>
																</xsl:if>
																<xsl:if test="RegCC:UseSealDocument/RegCC:PrDocumentTerm">
																	<xsl:text> до  </xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param select="RegCC:UseSealDocument/RegCC:PrDocumentTerm" name="dateIn"/>
																	</xsl:call-template>
																</xsl:if>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="RegCC:ApplicationType='ИЗ'">
									<tr>
										<td style="text-align: justify">
											<xsl:text>просит рассмотреть возможность внесения изменений в реестр таможенных перевозчиков следующих сведений: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="RegCC:ChangeDetails">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">
											<xsl:text>(указываются сведения о таможенном перевозчике, подлежащие изменению)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
								</xsl:when>
								<xsl:when test="RegCC:ApplicationType='ИС'">
									<tr>
										<td style="text-align: justify">
											<xsl:text>В связи с </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="RegCC:RegistryChangeReasons">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">
											<xsl:text>(указывается причина прекращения деятельности в качестве таможенного перевозчика)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта 2 пункта 1 статьи 408 Таможенного кодекса Евразийского экономического союза прошу рассмотреть возможность об исключении из реестра таможенных перевозчиков.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="(RegCC:ApplicationType='ВК') or (RegCC:ApplicationType='ИЗ')">
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%">
											<xsl:text>К заявлению прилагаются следующие документы, подтверждающие заявленные сведения:</xsl:text>
										</td>
									</tr>
									<xsl:if test="RegCC:AppOrganizationInfo/RegCC:FNSInfo">
										<tr>
											<td>
												<br/>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Cвидетельство о постановке на учет в налоговом органе: </xsl:text>
												<xsl:apply-templates select="RegCC:AppOrganizationInfo/RegCC:FNSInfo" mode="Certificate"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="RegCC:AppOrganizationInfo/RegCC:OGRNInfo">
										<tr>
											<td>
												<br/>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:text>Cвидетельство о внесении записи в ЕГРЮЛ: </xsl:text>
												<xsl:apply-templates select="RegCC:AppOrganizationInfo/RegCC:OGRNInfo" mode="Certificate"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td style="text-align: justify">
											<xsl:for-each select="RegCC:PresentedDocuments">
												<xsl:apply-templates select="." mode="PresentedDocuments"/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Общее количество листов </xsl:text>
											<u>&#160;&#160;<xsl:value-of select="RegCC:TotalSheetNumber"/>&#160;&#160;</u>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:apply-templates select="RegCC:AppOrganizationEmployee"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>М.П. (при наличии)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="PresentedDocuments" match="*">
		<xsl:if test="RegCC:PermittingDocuments">
			<br/>
			<xsl:text>Разрешительные документы на осуществление деятельности по перевозке грузов:</xsl:text>
			<xsl:for-each select="RegCC:PermittingDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="../RegCC:TransportInfo/RegCC:TransportUnitInfo/RegCC:UseSealDocument">
			<br/>
			<br/>
			<xsl:text>Свидетельства о допущении транспортных средств международной перевозки к перевозке товаров под таможенными пломбами и печатями:</xsl:text>
			<xsl:for-each select="../RegCC:TransportInfo/RegCC:TransportUnitInfo/RegCC:UseSealDocument">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="../RegCC:TransportInfo/RegCC:TransportUnitInfo/RegCC:SupportingDocument">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие право собственности, хозяйственного ведения, оперативного управления и аренды транспортных средств международной перевозки: </xsl:text>
			<xsl:for-each select="../RegCC:TransportInfo/RegCC:TransportUnitInfo/RegCC:SupportingDocument">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegCC:FoundDocuments">
			<br/>
			<br/>
			<xsl:text>Учредительные документы юридического лица: </xsl:text>
			<xsl:for-each select="RegCC:FoundDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegCC:NoDebtDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие отсутствие у заявителя задолженности (недоимки) в соответствии с законодательством о налогах и сборах (налоговым законодательством) государства-члена, в котором зарегистрирован заявитель: </xsl:text>
			<xsl:for-each select="RegCC:NoDebtDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegCC:FinStabilityDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие расчет значений показателей финансовой устойчивости и совокупного показателя финансовой устойчивости: </xsl:text>
			<xsl:for-each select="RegCC:FinStabilityDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegCC:NoCriminalDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, выданные компетентным органом государства-члена и подтверждающие отсутствие фактов привлечения к уголовной ответственности физических лиц государств-членов, являющихся акционерами заявителя, имеющими 10 и более процентов акций заявителя, его учредителями (участниками), руководителями, главными бухгалтерами: </xsl:text>
			<xsl:for-each select="RegCC:NoCriminalDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegCC:OtherDocuments">
			<br/>
			<br/>
			<xsl:text>Иные документы: </xsl:text>
			<xsl:for-each select="RegCC:OtherDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="DocumentInfo" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegCC:DocCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="RegCC:DocCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RegCC:PrDocumentTerm">
			<xsl:text>, срок действия до:    </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegCC:PrDocumentTerm" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegCC:DocumentIssueAgency">
			<xsl:text>, выдан   </xsl:text>
			<xsl:value-of select="RegCC:DocumentIssueAgency"/>
		</xsl:if>
		<xsl:if test="RegCC:DocumentSheetNumber">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="RegCC:DocumentSheetNumber"/>
			<xsl:text> л.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="CollateralDocument" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegCC:Amount">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegCC:Amount"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="bankInfo">
		<xsl:value-of select="cat_ru:BankName"/>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text> номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> тип счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccountDescription">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"> </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankMFO">
			<xsl:text> МФО: </xsl:text>
			<xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК: </xsl:text>
			<xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT: </xsl:text>
			<xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> корр.счет: </xsl:text>
			<xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<xsl:text> валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<xsl:text> валютный счет (специальный транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="addressStr" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organizationBase" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="RegCC:AppOrganizationOPF">
			<xsl:if test="(string-length(cat_ru:OrganizationName) &gt; 0) or (string-length(cat_ru:ShortName) &gt; 0)">,</xsl:if>
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RegCC:AppOrganizationOPF"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateTerm'">
					<xsl:text>(срок действия: до   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RegCC:AppOrganizationEmployee">
		<table class="graphMain" width="100%">
			<tbody>
				<tr>
					<td width="40%">
						<xsl:text>Руководитель организации</xsl:text>
					</td>
					<td class="value" width="15%"/>
					<td width="5%"/>
					<td align="center" class="value" width="40%">
						<xsl:apply-templates select="." mode="PersonBase"/>
					</td>
				</tr>
				<tr>
					<td/>
					<td class="graphLittle">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td class="graphLittle">
						<xsl:text>(фамилия, инициалы)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:choose>
							<xsl:when test="substring($date,1,2)">
								<xsl:value-of select="substring($date,1,2)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>20</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г. </td>
				</tr>
			</tbody>
		</table>
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
</xsl:stylesheet>
