<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России от 25.03.2019 №491 "Об утверждении Административного регламента Федеральной таможенной службы по предоставлению государственной услуги по ведению реестра владельцев свободных складов" Приложение "Административный регламент Федеральной таможенной службы по предоставлению государственной услуги по ведению реестра владельцев свободных складов"
Приложение № 1 - Заявление о включении в реестр владельцев свободных складов (ApplicationType=ВК)
Приложение № 2 - Заявление о внесении изменений в реестр владельцев свободных складов (ApplicationType=ИЗ)
Приложение № 3 - Заявление владельца свободного склада об исключении его из реестра владельцев свободных складов (ApplicationType=ИС)
Документ, не регламентируемый приказом - Заявление о возобновлении деятельности юридического лица в качестве владельца свободного склада (ApplicationType=ВД) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RegFW="urn:customs.ru:Information:RegistrationDocuments:ApplicationFreeWarehousesRegistry:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
	<!-- Шаблон для типа ApplicationFreeWarehousesRegistryType -->
	<xsl:template match="RegFW:ApplicationFreeWarehousesRegistry">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

					div.page
					{width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;
					vertical-align:bottom;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;
					text-align: center;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					.delim_3
					{height: 3pt;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
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
												<xsl:when test="RegFW:ApplicationType='ВК'">
													<xsl:text>о включении в реестр владельцев свободных складов</xsl:text>
												</xsl:when>
												<xsl:when test="RegFW:ApplicationType='ИЗ'">
													<xsl:text>о внесении изменений в реестр владельцев свободных складов</xsl:text>
												</xsl:when>
												<xsl:when test="RegFW:ApplicationType='ИС'">
													<xsl:text>владельца свободного склада об исключении его из реестра владельцев свободных складов</xsl:text>
												</xsl:when>
												<xsl:when test="RegFW:ApplicationType='ВД'">
													<xsl:text>о возобновлении деятельности юридического лица в качестве владельца свободного склада</xsl:text>
												</xsl:when>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
							<xsl:if test="RegFW:ApplicationType='ВД'">
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td class="graphMain" align="center">
										<xsl:text>регистрационный № </xsl:text>
										<u>
											<xsl:text>&#160;&#160;</xsl:text>
											<xsl:choose>
												<xsl:when test="RegFW:AppRegistrationNumber">
													<xsl:value-of select="RegFW:AppRegistrationNumber/RegFW:CustomsCode"/>/
													<xsl:value-of select="substring(RegFW:AppRegistrationNumber/RegFW:Date,9,2)"/>
													<xsl:value-of select="substring(RegFW:AppRegistrationNumber/RegFW:Date,6,2)"/>
													<xsl:value-of select="substring(RegFW:AppRegistrationNumber/RegFW:Date,3,2)"/>/
													<xsl:value-of select="RegFW:AppRegistrationNumber/RegFW:SerialNumber"/>/
													<xsl:value-of select="RegFW:AppRegistrationNumber/RegFW:DocumentType"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text>&#160;&#160;</xsl:text>
										</u>
									</td>
								</tr>
							</xsl:if>
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
													<xsl:choose>
														<xsl:when test="RegFW:ApplicationType='ВД'"><xsl:text>Начальнику</xsl:text></xsl:when>
														<xsl:otherwise><xsl:text>Руководителю</xsl:text></xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" width="35%" class="value">
													<xsl:apply-templates select="RegFW:Customs" mode="CustomsOffice"/>
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
													<xsl:apply-templates select="RegFW:CustomsPerson" mode="PersonBase"/>
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
												<td class="value">
													<xsl:call-template name="Date">
														<xsl:with-param select="RegFW:ApplicationDate" name="date"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td class="graphLittle">
													<xsl:text>(дата)</xsl:text>
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
									<xsl:apply-templates mode="organizationBase" select="RegFW:AppOrganizationInfo"/>
									<xsl:if test="RegFW:ApplicationType='ВД'">
										<xsl:if test="RegFW:FreeWHOwnersRegistryCertificate">
											<xsl:apply-templates select="RegFW:FreeWHOwnersRegistryCertificate" mode="Certificate"/>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:choose>
										<xsl:when test="RegFW:ApplicationType='ВК' or RegFW:ApplicationType='ИЗ'">
											<xsl:text>(наименование организации)</xsl:text>
										</xsl:when>
										<xsl:when test="RegFW:ApplicationType='ИС'">
											<xsl:text>(наименование организации - владельца свободного склада)</xsl:text>
										</xsl:when>
										<xsl:when test="RegFW:ApplicationType='ВД'">
											<xsl:text>(наименование организации, ИНН, № свидетельства владельца свободного склада, деятельность которого была приостановлена)</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="RegFW:ApplicationType='ВК'">
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td width="60%">
															<xsl:text>просит рассмотреть возможность включения</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:apply-templates select="RegFW:AppOrganizationInfo" mode="orgName"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="graphLittle">
															<xsl:text>(наименование организации)</xsl:text>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<xsl:text>в реестр владельцев свободных складов.</xsl:text>
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
											<xsl:text>СВЕДЕНИЯ О ЗАЯВИТЕЛЕ</xsl:text>
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
														<td width="55%"/>
														<td width="40%"/>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="3">
															<xsl:text> I. Общие сведения о Заявителе</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>1</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Полное наименование юридического лица</xsl:text>
														</td>
														<td class="bordered">
															<xsl:value-of select="RegFW:AppOrganizationInfo/cat_ru:OrganizationName"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>2</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Сокращенное наименование юридического лица (при наличии)</xsl:text>
														</td>
														<td class="bordered">
															<xsl:value-of select="RegFW:AppOrganizationInfo/cat_ru:ShortName"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>3</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Организационно-правовая форма юридического лица</xsl:text>
														</td>
														<td class="bordered">
															<xsl:value-of select="RegFW:AppOrganizationInfo/RUScat_ru:BusinessEntityTypeName"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>4</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Место нахождения юридического лица (адрес), почтовый адрес</xsl:text>
														</td>
														<td class="bordered">
															<xsl:if test="RegFW:AppOrganizationInfo/RUScat_ru:SubjectAddressDetails">
																<xsl:apply-templates mode="addressStr" select="RegFW:AppOrganizationInfo/RUScat_ru:SubjectAddressDetails"/>
																<xsl:if test="RegFW:GoodsAddress">
																	<xsl:text>;</xsl:text>
																</xsl:if>
															</xsl:if>
															<br>
																<xsl:apply-templates mode="addressStr" select="RegFW:GoodsAddress"/>
															</br>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>5</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Средства связи (адрес электронной почты, телефон), сайт информационно-телекоммуникационной сети "Интернет"</xsl:text>
														</td>
														<td class="bordered">
															<xsl:apply-templates mode="Contact" select="RegFW:AppOrganizationInfo/RegFW:OrganizationInfo/cat_ru:Contact"/>
															<xsl:if test="RegFW:AppOrganizationInfo/RegFW:OrganizationURL">
																<xsl:text> Cайт: </xsl:text>
																<xsl:value-of select="RegFW:AppOrganizationInfo/RegFW:OrganizationURL"/>
															</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>6</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Цели создания свободного склада (виды хозяйственной деятельности, которые предполагается осуществлять на свободном складе)</xsl:text>
														</td>
														<td class="bordered">
															<xsl:for-each select="RegFW:CreatingPurposes">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">
																	<xsl:text> </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="3">
															<xsl:text> II. Сведения о банковских счетах</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>7</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Открытые банковские счета</xsl:text>
														</td>
														<td class="bordered">
															<xsl:for-each select="RegFW:BankAccountInfo">
																<xsl:apply-templates select="." mode="bankInfo"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>;</xsl:text>
																	<br/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="3">
															<xsl:text> III. Сведения о здании (части здания), комплексе зданий, обустроенных и оборудованных территориях и (или) открытых площадках, об информационной системе Заявителя, используемой при учете товаров</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>8</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Сведения о здании (части здания), комплексе зданий, обустроенных и оборудованных территориях и (или) открытых площадках (далее - сооружения, помещения), находящихся во владении заявителя и предназначенных для использования в качестве свободного склада, об их месте нахождения с указанием кадастрового номера земельного участка, который предполагается включить в территорию свободного склада</xsl:text>
														</td>
														<td class="bordered">
															<xsl:for-each select="RegFW:WarehouseEquipmentInfo/RegFW:BuildingInfo">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">
																	<xsl:text> </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>9</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Сведения об обустройстве, оборудовании и о материально-техническом оснащении сооружений, помещений для целей создания свободного склада</xsl:text>
														</td>
														<td class="bordered">
															<xsl:for-each select="RegFW:WarehouseEquipmentInfo/RegFW:EquipmentInfo">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">
																	<xsl:text> </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>10</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Сведения о документах, подтверждающих право владения сооружениями, помещениями, предназначенными для использования в качестве свободного склада</xsl:text>
														</td>
														<td class="bordered">
															<xsl:for-each select="RegFW:WarehouseEquipmentInfo/RegFW:OwnershipConfirmInfo">
																<xsl:value-of select="position()"/>
																<xsl:text>) </xsl:text>
																<xsl:apply-templates select="." mode="OwnershipConfirmInfo"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>; </xsl:text>
																	<br/>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>11</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Сведения об информационной системе Заявителя, используемой при учете товаров</xsl:text>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="RegFW:WarehouseEquipmentInfo/RegFW:AccountingGoodsInfSystemAccountingGoods"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="3">
															<xsl:text> IV. Сведения об обеспечении исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>12</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Общая сумма обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
														</td>
														<td class="bordered">
															<xsl:value-of select="RegFW:CollateralInfo/RegFW:CollateralAmount"/>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>13</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Способ (способы) обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, номера и даты документов, подтверждающих обеспечение исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</xsl:text>
														</td>
														<td class="bordered">
															<xsl:for-each select="RegFW:CollateralInfo/RegFW:CollateralMeans">
																<xsl:if test="RegFW:CollMoneyDocAmount">
																	<xsl:text> Внесение денежных средств (денег) на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegFW:CollMoneyDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegFW:CollBankGuaranteeDocAmount">
																	<xsl:text> Банковская гарантия на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegFW:CollBankGuaranteeDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegFW:CollGuaranteeDocAmount">
																	<xsl:text> Поручительство на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegFW:CollGuaranteeDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegFW:CollPropertyPawningDocAmount">
																	<xsl:text> Залог имущества на сумму, эквивалентную сумме в евро: </xsl:text>
																	<xsl:apply-templates select="RegFW:CollPropertyPawningDocAmount" mode="CollateralDocument"/>
																</xsl:if>
																<xsl:if test="RegFW:CollOtherDocAmount">
																	<xsl:for-each select="RegFW:CollOtherDocAmount">
																		<xsl:text> Обеспечение исполнения обязанности иным способом на сумму, эквивалентную сумме в евро: </xsl:text>
																		<xsl:value-of select="RegFW:CollOther"/>
																		<xsl:text>: </xsl:text>
																		<xsl:apply-templates select="RegFW:DocAmount" mode="CollateralDocument"/>
																	</xsl:for-each>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center" colspan="3">
															<xsl:text> V. Сведения о намерении осуществлять временное хранение иностранных товаров на свободном складе</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="bordered" align="center">
															<xsl:text>14</xsl:text>
														</td>
														<td class="bordered">
															<xsl:text>Сведения о намерении осуществлять временное хранение иностранных товаров на свободном складе</xsl:text>
														</td>
														<td class="bordered">
															<xsl:choose>
																<xsl:when test="RegFW:ForeignGoodsStorage/RegFW:ForeignGoodsIndicator='true' or RegFW:ForeignGoodsStorage/RegFW:ForeignGoodsIndicator='t' or RegFW:ForeignGoodsStorage/RegFW:ForeignGoodsIndicator='1'">
																	<xsl:text>ДА </xsl:text>
																</xsl:when>
																<xsl:when test="RegFW:ForeignGoodsStorage/RegFW:ForeignGoodsIndicator='false' or RegFW:ForeignGoodsStorage/RegFW:ForeignGoodsIndicator='f' or RegFW:ForeignGoodsStorage/RegFW:ForeignGoodsIndicator='0'">
																	<xsl:text>НЕТ </xsl:text>
																</xsl:when>
															</xsl:choose>
															<xsl:if test="RegFW:ForeignGoodsStorage/RegFW:EquipmentInfo">
																<br/>
																<xsl:for-each select="RegFW:ForeignGoodsStorage/RegFW:EquipmentInfo">
																	<xsl:value-of select="."/>
																	<xsl:if test="position()!=last()">
																		<xsl:text> </xsl:text>
																	</xsl:if>
																</xsl:for-each>
															</xsl:if>
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
										<td style="text-indent: 5%">
											<xsl:text>К заявлению прилагаются следующие документы, подтверждающие заявленные сведения:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:for-each select="RegFW:PresentedDocuments">
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
											<u>&#160;&#160;<xsl:value-of select="RegFW:TotalSheetNumber"/>&#160;&#160;</u>
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
											<xsl:apply-templates select="RegFW:AppOrganizationEmployee"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="RegFW:ApplicationType='ИЗ'">
									<tr>
										<td style="text-align: justify">
											<xsl:text>просит рассмотреть возможность внесения изменений в реестр владельцев свободных складов следующих сведений: </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="RegFW:ChangeDetails">
												<xsl:value-of select="."/>
												<!--xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if-->
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">
											<xsl:text>(указываются сведения о владельце свободного склада, подлежащие изменению)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-align: 5%">
											<xsl:text>К заявлению прикладываются следующие документы, подтверждающие заявленные сведения:</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:for-each select="RegFW:PresentedDocuments">
												<xsl:apply-templates select="." mode="PresentedDocuments"/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Общее количество листов </xsl:text>
											<u>&#160;&#160;<xsl:value-of select="RegFW:TotalSheetNumber"/>&#160;&#160;</u>
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
											<xsl:apply-templates select="RegFW:AppOrganizationEmployee"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="RegFW:ApplicationType='ИС'">
									<tr>
										<td style="text-align: justify">
											<xsl:text>В связи с </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="RegFW:RegistryChangeReasons">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">
											<xsl:text>(указывается причина прекращения деятельности в качестве владельца свободного склада)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании подпункта 2 пункта 1 статьи 423 Таможенного кодекса Евразийского экономического союза прошу рассмотреть возможность исключения из реестра владельцев таможенных складов.</xsl:text>
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
											<xsl:apply-templates select="RegFW:AppOrganizationEmployee"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="RegFW:ApplicationType='ВД'">
									<tr>
										<td>
											<xsl:text>прошу рассмотреть вопрос о возобновлении деятельности в качестве владельца свободного склада.</xsl:text>
											<br/>
											<br/>
											<xsl:text>Основания для приостановления деятельности в качестве владельца свободного склада, доведенные таможенным органом </xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="value" width="40%">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:choose>
																<xsl:when test="RegFW:NotifRegistrationNumber">
																	<xsl:value-of select="RegFW:NotifRegistrationNumber/RegFW:CustomsCode"/>/<xsl:value-of select="substring(RegFW:NotifRegistrationNumber/RegFW:Date,9,2)"/>
																	<xsl:value-of select="substring(RegFW:NotifRegistrationNumber/RegFW:Date,6,2)"/>
																	<xsl:value-of select="substring(RegFW:NotifRegistrationNumber/RegFW:Date,3,2)"/>/<xsl:value-of select="RegFW:NotifRegistrationNumber/RegFW:SerialNumber"/>/<xsl:value-of select="RegFW:NotifRegistrationNumber/RegFW:DocumentType"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text>&#160;&#160;</xsl:text>
														</td>
														<td width="60%">
															<xsl:text>устранены.</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graphLittle">
															<xsl:text>(указывается № уведомления)</xsl:text>
														</td>
														<td/>
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
										<td style="text-indent: 5%">
											<xsl:text>Документы (опись)</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:for-each select="RegFW:PresentedDocuments">
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
											<xsl:apply-templates select="RegFW:AppOrganizationEmployee"/>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="PresentedDocuments" match="*">
		<xsl:if test="RegFW:FoundDocuments">
			<br/>
			<br/>
			<xsl:text>Учредительные документы юридического лица: </xsl:text>
			<xsl:for-each select="RegFW:FoundDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegFW:NoDebtDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие отсутствие у заявителя задолженности (недоимки) в соответствии с законодательством о налогах и сборах (налоговым законодательством) государства-члена, в котором зарегистрирован заявитель: </xsl:text>
			<xsl:for-each select="RegFW:NoDebtDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegFW:FinStabilityDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие расчет значений показателей финансовой устойчивости и совокупного показателя финансовой устойчивости: </xsl:text>
			<xsl:for-each select="RegFW:FinStabilityDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegFW:NoCriminalDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, выданные компетентным органом государства-члена и подтверждающие отсутствие фактов привлечения к уголовной ответственности физических лиц государств-членов, являющихся акционерами заявителя, имеющими 10 и более процентов акций заявителя, его учредителями (участниками), руководителями, главными бухгалтерами: </xsl:text>
			<xsl:for-each select="RegFW:NoCriminalDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegFW:AccountingSyatemDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие наличие у заявителя системы учета товаров, отвечающей установленным законодательством государства-члена о таможенном регулировании требованиям, позволяющей сопоставлять сведения, представленные таможенным органам при совершении таможенных операций, со сведениями о проведении хозяйственных операций и обеспечивающей доступ (в том числе удаленный) таможенных органов к таким сведениям:</xsl:text>
			<xsl:for-each select="RegFW:AccountingSyatemDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegFW:HasWarehouseDocuments">
			<br/>
			<br/>
			<xsl:text>Документы, подтверждающие наличие у заявителя, претендующего на получение свидетельства второго или третьего типа, сооружений, помещений (частей помещений) и (или) открытых площадок (частей открытых площадок), предназначенных для временного хранения товаров, завершения действия таможенной процедуры таможенного транзита и (или) проведения таможенного контроля:</xsl:text>
			<xsl:for-each select="RegFW:HasWarehouseDocuments">
				<br/>
				<xsl:value-of select="position()"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="." mode="DocumentInfo"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RegFW:OtherDocuments">
			<br/>
			<br/>
			<xsl:text>Иные документы: </xsl:text>
			<xsl:for-each select="RegFW:OtherDocuments">
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
		<xsl:if test="RegFW:DocCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="RegFW:DocCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RegFW:PrDocumentTerm">
			<xsl:text>, срок действия до:    </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegFW:PrDocumentTerm" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegFW:DocumentIssueAgency">
			<xsl:text>, выдан   </xsl:text>
			<xsl:value-of select="RegFW:DocumentIssueAgency"/>
		</xsl:if>
		<xsl:if test="RegFW:DocumentSheetNumber">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="RegFW:DocumentSheetNumber"/>
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
		<xsl:if test="RegFW:Amount">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegFW:Amount"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="OwnershipConfirmInfo" match="*">
		<xsl:value-of select="RegFW:PropObjectName"/>
		<xsl:if test="RegFW:PropObjectPurpose">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegFW:PropObjectPurpose"/>
		</xsl:if>
		<xsl:if test="RegFW:PropObjectArea">
			<xsl:text>, площадь: </xsl:text>
			<xsl:apply-templates select="RegFW:PropObjectArea" mode="supQuantity"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="RegFW:OwnStoragePlace">
				<xsl:text> в собственности, </xsl:text>
				<xsl:apply-templates select="RegFW:OwnStoragePlace"/>
			</xsl:when>
			<xsl:when test="RegFW:RentStoragePlace">
				<xsl:text> в аренде, </xsl:text>
				<xsl:apply-templates select="RegFW:RentStoragePlace"/>
			</xsl:when>
			<xsl:when test="RegFW:OperManagementStoragePlace">
				<xsl:text> в хозяйственном владении / оперативном управлении, </xsl:text>
				<xsl:apply-templates mode="Manage" select="RegFW:OperManagementStoragePlace"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RegFW:PropObjectDetails">
			<xsl:text> </xsl:text>
			<xsl:value-of select="RegFW:PropObjectDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegFW:OwnStoragePlace">
		<xsl:apply-templates select="RegFW:OwnershipCertificate" mode="Certificate"/>
		<xsl:choose>
			<xsl:when test="RegFW:EncumbrancesIndicator='true' or RegFW:EncumbrancesIndicator='t'  or RegFW:EncumbrancesIndicator='1'">
				<xsl:text> (с обременениями</xsl:text>
			</xsl:when>
			<xsl:when test="RegFW:EncumbrancesIndicator='false' or RegFW:EncumbrancesIndicator='f'  or RegFW:EncumbrancesIndicator='0'">
				<xsl:text> (без обременений</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="not(RegFW:EncumbrancesDetails)">
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="RegFW:EncumbrancesDetails">
			<xsl:text>: </xsl:text>
			<xsl:value-of select="RegFW:EncumbrancesDetails"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegFW:RentStoragePlace">
		<xsl:choose>
			<xsl:when test="RegFW:TempIndicator='true' or RegFW:TempIndicator='t' or RegFW:TempIndicator='1'">
				<xsl:text>временное владение и пользование, </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="RegFW:RentAgreement" mode="RentAgreement"/>
		<xsl:if test="RegFW:AgreementDetails">
			<xsl:text>, условия аренды: </xsl:text>
			<xsl:value-of select="RegFW:AgreementDetails"/>
		</xsl:if>
		<xsl:if test="RegFW:PermittedUsing">
			<xsl:text>, разрешенное использование: </xsl:text>
			<xsl:value-of select="RegFW:PermittedUsing"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="Manage" match="*">
		<xsl:choose>
			<xsl:when test="RegFW:Certificate">
				<xsl:apply-templates select="RegFW:Certificate" mode="Certificate"/>
			</xsl:when>
			<xsl:when test="RegFW:Agreement">
				<xsl:apply-templates select="RegFW:Agreement" mode="RentAgreement"/>
			</xsl:when>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RegFW:OperManagementNotes"/>
	</xsl:template>
	<xsl:template mode="RentAgreement" match="*">
		<xsl:text> договор: </xsl:text>
		<xsl:if test="RegFW:AgreemNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="RegFW:AgreemNumber"/>
		</xsl:if>
		<xsl:if test="RegFW:AgreemDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegFW:AgreemDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegFW:AgreemTill">
			<xsl:text>, срок действия до:    </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegFW:AgreemTill" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegFW:RegistryAgreemNumber or RegFW:RegistryAgreemDate">
			<xsl:text> (по Росреестру: </xsl:text>
			<xsl:if test="RegFW:RegistryAgreemNumber">
				<xsl:text> №  </xsl:text>
				<xsl:value-of select="RegFW:RegistryAgreemNumber"/>
			</xsl:if>
			<xsl:if test="RegFW:RegistryAgreemDate">
				<xsl:text> от   </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param select="RegFW:RegistryAgreemDate" name="dateIn"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="Certificate" match="*">
		<xsl:text> свидетельство: </xsl:text>
		<xsl:if test="RegFW:CertificateSeries">
			<xsl:text> серия </xsl:text>
			<xsl:value-of select="RegFW:CertificateSeries"/>
		</xsl:if>
		<xsl:if test="RegFW:CertificateNumber">
			<xsl:text> №  </xsl:text>
			<xsl:value-of select="RegFW:CertificateNumber"/>
		</xsl:if>
		<xsl:if test="RegFW:CertificateDate">
			<xsl:text> от   </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegFW:CertificateDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RegFW:CertificateAgency">
			<xsl:text> выдан   </xsl:text>
			<xsl:value-of select="RegFW:CertificateAgency"/>
		</xsl:if>
		<xsl:if test="RegFW:CertificateTerm">
			<xsl:text>, срок действия до     </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="RegFW:CertificateTerm" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="supQuantity" match="*">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
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
			<xsl:text>,&#160;</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
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
				<xsl:text>;</xsl:text>
				<br/>
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
	<xsl:template mode="orgName" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
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
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organizationFull" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">,&#032;ОКПО:&#032;<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKATOCode">,&#032;ОКАТО:&#032;<xsl:value-of select="cat_ru:OKATOCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:Contact">,&#032;<xsl:apply-templates select="cat_ru:Contact" mode="Contact"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RegFW:AppOrganizationEmployee">
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
					<td align="center" class="graphLittle">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td align="center" class="graphLittle">
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
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
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
					<td width="9%" class="border_bottom" align="left">
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
