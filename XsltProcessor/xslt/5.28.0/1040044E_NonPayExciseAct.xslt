<?xml version="1.0" encoding="utf-8"?>
<!-- Проект распоряжения ФТС России «Об утверждении Порядка действий должностных лиц таможенных органов при совершения операций при взимании акцизов по подакцизным товарам Евразийского экономического союза, ввозимым на территорию Российской Федерации с территории государства – члена Евразийского экономического союза, подлежащим в соответствии с законодательством Российской Федерации маркировке акцизными
и федеральными специальными марками, и проведении контроля полноты и своевременности их уплаты с применением информационных программных средств Единой автоматизированной информационной системы таможенных органов»  -->
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:npea="urn:customs.ru:Information:ELSDocuments:NonPayExciseAct:5.28.0">
	<!-- Шаблон для типа NonPayExciseActype -->
	<xsl:template match="//*[local-name()='npea:NonPayExciseAct']//*" priority="-1">
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
	<xsl:template match="npea:NonPayExciseAct">
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

					div.page_album {
					width: 267mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 10mm;
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
                  font-size: 9pt;
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
											<xsl:text>Акт обнаружения неуплаты акциза по маркированным товарам Евразийского экономического союза</xsl:text>
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
									<table>
										<tbody class="title">
											<font size="4">
												<b>
													<tr>
														<td class="title" width="25%" align="right">
															<xsl:text> от  </xsl:text>
														</td>
														<td width="25%" align="left">
															<xsl:apply-templates select="npea:ActDate" mode="date_str"/>
														</td>
														<td width="5%" align="center">
															<xsl:text> № </xsl:text>
														</td>
														<td width="45%" align="left">
															<u>
																<xsl:apply-templates select="npea:ActRegNumber" mode="decl"/>
															</u>
														</td>
													</tr>
												</b>
											</font>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify; text-indent: 5%">
									<xsl:text>1. В связи с обнаружением факта неуплаты (неполной уплаты) акциза по маркированным товарам Евразийского экономического союза (пеней), выявленного в результате проведения таможенного контроля в соответствии с  </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="npea:CustomsControlDoc">
										<xsl:apply-templates select="." mode="doc_base"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:text>(даты и номера документов, составленных по результатам проведения таможенного контроля)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="15%">в отношении  </td>
												<td class="value" width="85%">
													<xsl:for-each select="npea:ImportBaseDoc">
														<xsl:apply-templates select="." mode="doc_base"/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
													<xsl:if test="npea:OtherDoc and npea:ImportBaseDoc">, </xsl:if>
													<xsl:for-each select="npea:OtherDoc">
														<xsl:apply-templates select="." mode="doc_base"/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(номера документов, на основании которых производился ввоз маркированных товаров ЕАЭС, номера иных документов, позволяющих идентифицировать товары (номера контрактов, счетов фактур, книжек МДП и т.д.), в отношении которых были выявлены нарушения, влекущие возникновение обязанности по уплате акциза по маркированным товарам ЕАЭС)</xsl:text>
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
								<td style="text-align: justify">
									<xsl:text>и выявлением следующих фактов, повлиявших на размер подлежащего уплате (доплате) акциза по маркированным товарам ЕАЭС:  </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="npea:Contravention">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:text>(указываются факты, влекущие возникновение обязанности по уплате (доплате) акциза по маркированным товарам ЕАЭС)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>составлен настоящий акт.</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify; text-indent: 5%">
									<xsl:text>2. Расчет подлежащего уплате (доплате) акциза по маркированным товарам ЕАЭС</xsl:text>
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
									<table>
										<tbody>
											<tr valign="bottom">
												<td width="12%">Продавец</td>
												<td class="value" width="30%">
													<xsl:for-each select="npea:Supplier">
														<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
														<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
														<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
														<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
														<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
													</xsl:for-each>
												</td>
												<td width="16%"/>
												<td width="12%">Покупатель</td>
												<td class="value" width="30%">
													<xsl:for-each select="npea:Buyer">
														<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr valign="top">
												<td colspan="2" class="graphLittle">УНП или УНН или РНН/(БИН/ИИН) или ИНН/КПП  или ИНН или ПИН</td>
												<td/>
												<td colspan="2" class="graphLittle">ИНН/КПП, ОКПО</td>
											</tr>
											<tr valign="bottom">
												<td colspan="2" class="value">
													<xsl:for-each select="npea:Supplier">
														<xsl:apply-templates select="cat_ru:OrganizationName"/>
														<xsl:if test="cat_ru:ShortName">
															<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
															<xsl:apply-templates select="cat_ru:ShortName"/>
															<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td/>
												<td colspan="2" class="value">
													<xsl:for-each select="npea:Buyer">
														<xsl:apply-templates select="cat_ru:OrganizationName"/>
														<xsl:if test="cat_ru:ShortName">
															<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
															<xsl:apply-templates select="cat_ru:ShortName"/>
															<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr valign="top">
												<td colspan="2" class="graphLittle">(наименование организации, (Ф.И.О. индивидуального предпринимателя))                 </td>
												<td/>
												<td colspan="2" class="graphLittle">(наименование организации, (Ф.И.О. индивидуального предпринимателя))                </td>
											</tr>
											<tr valign="bottom">
												<td colspan="2" class="value">
													<xsl:for-each select="npea:Supplier/npea:Address">
														<xsl:apply-templates mode="ru_address" select="."/>
													</xsl:for-each>
												</td>
												<td/>
												<td colspan="2" class="value">
													<xsl:for-each select="npea:Buyer/npea:Address">
														<xsl:apply-templates mode="ru_address" select="."/>
													</xsl:for-each>
												</td>
											</tr>
											<tr valign="top">
												<td colspan="2" class="graphLittle">(код страны, место нахождения (жительства))                           </td>
												<td/>
												<td colspan="2" class="graphLittle">(код страны, место нахождения (жительства))  </td>
											</tr>
											<tr valign="bottom">
												<td colspan="3"/>
												<td colspan="2" class="value">
													<xsl:for-each select="npea:Buyer/npea:BankAccInfo">
														<xsl:apply-templates mode="bankinfo" select="."/>
													</xsl:for-each>
												</td>
											</tr>
											<tr valign="bottom">
												<td colspan="3"/>
												<td colspan="2" class="graphLittle">(банковские реквизиты)</td>
											</tr>
											<tr valign="bottom">
												<td class="delim_3" colspan="5">
													<br/>
													<br/>
												</td>
											</tr>
											<tr valign="bottom">
												<td colspan="2">
													<xsl:text>Номер договора (контракта) </xsl:text>
													<xsl:choose>
														<xsl:when test="npea:ContractDocument/cat_ru:PrDocumentNumber">
															<u>
																<i>
																	<xsl:apply-templates select="npea:ContractDocument/cat_ru:PrDocumentNumber"/>
																</i>
															</u>
														</xsl:when>
														<xsl:otherwise>___________</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" colspan="3">
													<xsl:text>Дата договора (контракта) </xsl:text>
													<xsl:choose>
														<xsl:when test="npea:ContractDocument/cat_ru:PrDocumentDate">
															<u>
																<i>
																	<xsl:apply-templates mode="russian_date" select="npea:ContractDocument/cat_ru:PrDocumentDate"/>
																</i>
															</u> г. </xsl:when>
														<xsl:otherwise>_____________ 20__ г.</xsl:otherwise>
													</xsl:choose>
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
								<td>
									<table>
										<tbody>
											<tr>
												<td style="text-align: justify" width="35%">
													<xsl:text>Производитель товара </xsl:text>
												</td>
												<td class="value" width="65%">
													<xsl:apply-templates select="npea:Producer/npea:ProducerName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="npea:Producer/npea:CountryCode"/>
													<xsl:text> </xsl:text>
													<xsl:for-each select="npea:Producer/npea:Address">
														<xsl:apply-templates mode="pointSeparated"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">(код страны происхождения товара, наименование производителя, его местонахождение (адрес))</td>
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
								<td>
									<xsl:text>Номер заявления о выдаче (приобретении) акцизных (федеральных специальных) марок </xsl:text>
									<xsl:choose>
										<xsl:when test="npea:AppBuyExciseStampsDocument/cat_ru:PrDocumentNumber">
											<u>
												<i>
													<xsl:apply-templates select="npea:AppBuyExciseStampsDocument/cat_ru:PrDocumentNumber"/>
												</i>
											</u>
										</xsl:when>
										<xsl:otherwise>___________</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page_album">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td align="right">
									<b>
										<u>
											<xsl:text>Акт № </xsl:text>
											<xsl:apply-templates select="npea:ActRegNumber" mode="decl"/>
										</u>
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
									<table width="100%">
										<tbody>
											<tr>
												<td width="2%"/>
												<td width="7%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="6%"/>
												<td width="6%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="6%"/>
												<td width="5%"/>
												<td width="5%"/>
												<td width="6%"/>
												<td width="6%"/>
												<td width="4%"/>
												<td width="7%"/>
												<td width="7%"/>
											</tr>
											<tr align="center">
												<td class="bordered" rowspan="2">№ п/п</td>
												<td class="bordered" rowspan="2">Наименование товара</td>
												<td class="bordered" rowspan="2">Код товара ТН ВЭД ЕАЭС</td>
												<td class="bordered" rowspan="2">Коли-
чество
товара
в нату-
ральном
выраже-
нии</td>
												<td class="bordered" rowspan="2">Количест-
во товара
в едини-
цах, ис-
пользуе-
мых для
расчета
акциза</td>
												<td class="bordered" rowspan="2">Единица
измерения
количест-
ва товара
для целей
примене-
ния став-
ки акциза</td>
												<td class="bordered" colspan="2">Стоимость товара</td>
												<td class="bordered" colspan="2">Валюта</td>
												<td class="bordered" rowspan="2">Серии и номера акцизных (федеральных специальных) марок </td>
												<td class="bordered" colspan="2">Транспортный
(товаросо-
проводитель-
ный) доку-
мент</td>
												<td class="bordered" colspan="2">Счет-
фактура</td>
												<td class="bordered" rowspan="2">Дата принятия товара на учет</td>
												<td class="bordered" rowspan="2">Налоговая база</td>
												<td class="bordered" rowspan="2">Ставка
акциза</td>
												<td class="bordered" rowspan="2">Сумма
акциза
к
уплате, руб.</td>
												<td class="bordered" rowspan="2">Сумма пеней, руб.</td>
											</tr>
											<tr align="center">
												<td class="bordered">в рублях</td>
												<td class="bordered">в валюте договора</td>
												<td class="bordered">код</td>
												<td class="bordered">курс</td>
												<td class="bordered">серия, номер</td>
												<td class="bordered">дата</td>
												<td class="bordered">номер</td>
												<td class="bordered">дата</td>
											</tr>
											<tr align="center">
												<td class="bordered">1</td>
												<td class="bordered">2</td>
												<td class="bordered">3</td>
												<td class="bordered">4</td>
												<td class="bordered">5</td>
												<td class="bordered">6</td>
												<td class="bordered">7</td>
												<td class="bordered">8</td>
												<td class="bordered">9</td>
												<td class="bordered">10</td>
												<td class="bordered">11</td>
												<td class="bordered">12</td>
												<td class="bordered">13</td>
												<td class="bordered">14</td>
												<td class="bordered">15</td>
												<td class="bordered">16</td>
												<td class="bordered">17</td>
												<td class="bordered">18</td>
												<td class="bordered">19</td>
												<td class="bordered">20</td>
											</tr>
											<xsl:for-each select="npea:GoodsInfo">
												<tr>
													<td class="bordered">
														<xsl:apply-templates select="RUScat_ru:GoodsNumeric"/>
													</td>
													<td class="bordered">
														<xsl:for-each select="RUScat_ru:GoodsDescription">
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="RUScat_ru:GoodsTNVEDCode"/>
													</td>
													<td class="bordered">
														<xsl:if test="RUScat_ru:GoodsMeasureDetails[1]">
															<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[1]/cat_ru:GoodsQuantity"/>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:if test="RUScat_ru:GoodsMeasureDetails[2]">
															<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:GoodsQuantity"/>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:if test="RUScat_ru:GoodsMeasureDetails[2]">
															<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:MeasureUnitQualifierName"/>
															<xsl:if test="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:MeasureUnitQualifierCode">
																<xsl:if test="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:MeasureUnitQualifierName">
																	<xsl:text> (</xsl:text>
																	<xsl:apply-templates select="RUScat_ru:GoodsMeasureDetails[2]/cat_ru:MeasureUnitQualifierCode"/>
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</xsl:if>
														</xsl:if>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:InvoicedCost"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:InvoicedCostCur"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:CurCode"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:CurRate"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="doc_base" select="npea:PermissiveDocument"/>
														<xsl:for-each select="npea:IssueStampInfo">
															<xsl:if test="catESAD_cu:ExciseQuantity">кол-во: <xsl:apply-templates select="catESAD_cu:ExciseQuantity"/>
															</xsl:if>
															<xsl:text> </xsl:text>
															<xsl:if test="catESAD_cu:ExciseSerieses">серия: <xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
															</xsl:if>
															<xsl:text> </xsl:text>
															<xsl:if test="catESAD_cu:ExciseList"> (<xsl:for-each select="catESAD_cu:ExciseList">
																	<xsl:for-each select="catESAD_cu:ExciseNumber">
																		<xsl:apply-templates select="."/>
																		<xsl:if test="position()!=last()">, </xsl:if>
																	</xsl:for-each>
																</xsl:for-each>)</xsl:if>
															<xsl:text> </xsl:text>
															<xsl:if test="catESAD_cu:ExciseRange"> (<xsl:for-each select="catESAD_cu:ExciseRange">
																	<xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
																	<xsl:text>-</xsl:text>
																	<xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
																	<xsl:if test="position()!=last()">
																		<xsl:if test="position()!=last()">, </xsl:if>
																	</xsl:if>
																</xsl:for-each>)</xsl:if>
															<br/>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:TransDocument/cat_ru:PrDocumentNumber"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="russian_date" select="npea:TransDocument/cat_ru:PrDocumentDate"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:InvoiceDocument/cat_ru:PrDocumentNumber"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="russian_date" select="npea:InvoiceDocument/cat_ru:PrDocumentDate"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates mode="russian_date" select="npea:GoodsAccDate"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:TaxBase"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:ExciseRate"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:ExciseSum"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="npea:PenaltiesSum"/>
													</td>
												</tr>
											</xsl:for-each>
											<tr align="center">
												<td colspan="2" class="bordered">ИТОГО: </td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered"/>
												<td class="bordered">X</td>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered">X</td>
												<td class="bordered"/>
												<td class="bordered"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify; text-indent: 5%">3. Лица, на которых в соответствии со статьей 186.1 Налогового кодекса Российской Федерации возложена обязанность по уплате акциза по маркированным товарам ЕАЭС в отношении товаров, за которые был не уплачен (не полностью уплачен) акциз по маркированным товарам ЕАЭС, являются:  </td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="npea:ObligedPerson">
										<xsl:apply-templates select="npea:OrganizationName"/>
										<xsl:if test="string-length(npea:INN) &gt; 0 or string-length(npea:KPP) &gt; 0">
											<xsl:text> </xsl:text>
											<span class="italic">
												<xsl:if test="string-length(npea:INN) &gt; 0">
													<span class="italic">ИНН</span>
												</xsl:if>
												<xsl:if test="string-length(npea:INN) &gt; 0 and string-length(npea:KPP) &gt; 0">
													<span class="normal">/</span>
												</xsl:if>
												<xsl:if test="string-length(npea:KPP) &gt; 0">
													<span class="italic">КПП</span>
												</xsl:if>
												<span class="normal">:&#032;</span>
											</span>
										</xsl:if>
										<xsl:if test="npea:INN">
											<xsl:apply-templates select="npea:INN"/>
										</xsl:if>
										<xsl:if test="npea:KPP">
											<xsl:if test="string-length(npea:INN) &gt; 0">
												<span class="normal">&#032;/&#032;</span>
											</xsl:if>
											<xsl:apply-templates select="npea:KPP"/>
										</xsl:if>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="npea:Address">
											<xsl:apply-templates mode="ru_address" select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">(полное наименование, коды ИНН, КПП, юридический и почтовый адрес или Ф.И.О. физического лица, ИНН, паспортные данные, адрес)</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>Приложение: на  <xsl:choose>
										<xsl:when test="npea:Sheets">
											<span class="value">
												<xsl:apply-templates select="npea:Sheets"/>
											</span>
										</xsl:when>
										<xsl:otherwise>_____</xsl:otherwise>
									</xsl:choose> листах.</td>
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
									<table width="60%">
										<tbody>
											<tr>
												<td width="17%"/>
												<td width="5%"/>
												<td width="10%"/>
												<td width="5%"/>
												<td width="18%"/>
												<td width="45%"/>
											</tr>
											<tr>
												<td colspan="3">Начальник (заместитель начальника)
таможенного органа</td>
												<td colspan="2"/>
												<td/>
											</tr>
											<tr>
												<td class="delim_3" colspan="6">
													<br/>
												</td>
											</tr>
											<tr valign="bottom">
												<td class="value">
													<xsl:apply-templates select="npea:CustHeadSignature/cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="npea:CustHeadSignature/npea:SpecialTitle"/>
												</td>
												<td/>
												<td class="value"/>
												<td/>
												<td class="value">
													<xsl:apply-templates select="npea:CustHeadSignature/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="npea:CustHeadSignature/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="npea:CustHeadSignature/cat_ru:PersonMiddleName"/>
												</td>
												<td/>
											</tr>
											<tr valign="top">
												<td class="graphLittle">(должность, специальное звание)</td>
												<td/>
												<td class="graphLittle">(подпись)</td>
												<td/>
												<td class="graphLittle">(Ф.И.О.)</td>
												<td/>
											</tr>
											<tr>
												<td class="delim_3" colspan="6"/>
											</tr>
											<xsl:for-each select="npea:InspectorSignature">
												<tr>
													<td colspan="3">Должностное лицо таможенного органа:</td>
													<td colspan="2"/>
													<td/>
												</tr>
												<tr>
													<td class="delim_3" colspan="6">
														<br/>
													</td>
												</tr>
												<tr valign="bottom">
													<td class="value">
														<xsl:apply-templates select="cat_ru:PersonPost"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="npea:SpecialTitle"/>
													</td>
													<td/>
													<td class="value"/>
													<td/>
													<td class="value">
														<xsl:apply-templates select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
													</td>
													<td/>
												</tr>
												<tr valign="top">
													<td class="graphLittle">(должность, специальное звание)</td>
													<td/>
													<td class="graphLittle">(подпись)</td>
													<td/>
													<td class="graphLittle">(Ф.И.О.)</td>
													<td/>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="bankinfo" match="*">
	тип счета: 
	<xsl:for-each select="cat_ru:BankAccountDescription">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>	
	; счет(а): 
	<xsl:for-each select="cat_ru:BankAccount">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="cat_ru:BankName">
		; банк: <xsl:value-of select="cat_ru:BankName"/>
		</xsl:if>
		<xsl:if test="cat_ru:BankMFO">
		; МФО банка: <xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
		; ОКПО банка: <xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
		; БИК: <xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
		; SWIFT банка: <xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
		; к/с банка: <xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
		; к/с банка: <xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
		; валютный счет организации (транзитный):&#160;
		<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
		; валютный счет организации (специальный транзитный):&#160;
		<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
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
	<xsl:template match="*" mode="decl">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="npea:DocKindCode"> (<xsl:apply-templates select="npea:DocKindCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="goods_group" match="*">
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerINN">
			<xsl:text> ИНН производителя </xsl:text>
			<xsl:apply-templates select="catESAD_cu:ManufacturerINN"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Тов.знак </xsl:text>
			<xsl:apply-templates select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Торг. знак, марка </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул</xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
				<xsl:text> Наим.сортимента: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
				<xsl:text> Порода древесины: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
				<xsl:text> Наименование сорта:</xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
				<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
				<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
				<xsl:text> Диапазон диаметров: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
				<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
				<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Размеры </xsl:text>
			<xsl:apply-templates mode="size_details" select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата выпуска </xsl:text>
			<xsl:apply-templates select="catESAD_cu:DateIssue" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во </xsl:text>
			<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="size_details" match="*">
		<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">(<xsl:apply-templates select="."/>)</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateValidity'">
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
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:apply-templates select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:apply-templates select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">&#032;</span>
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
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:BIN"/>
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
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:apply-templates select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:apply-templates select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:apply-templates select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
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
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:apply-templates select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:apply-templates select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization_base" match="*">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="npea:ResidentCertificate">
			<xsl:text> свидетельство  </xsl:text>
			<xsl:for-each select="npea:ResidentCertificate">
				<xsl:apply-templates select="." mode="Certificate"/>
				<xsl:if test="position()!=last()">
					<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="confirm_authority_doc">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='PrDocumentNumber'">
					<xsl:text> №  </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='PrDocumentDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='ComplationAuthorityDate'">
					<xsl:text>(дата окончания полномочий:   </xsl:text>
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
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="pointSeparated">
		<xsl:if test="position() > 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="date_str">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_str">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="date_str">
		<xsl:param name="dateIn"/> "<u>
			<xsl:value-of select="substring($dateIn,9,2)"/>
		</u>"<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
		<xsl:text> </xsl:text>
		<u>
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
		</u>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="substring($dateIn,1,2)">
				<xsl:value-of select="substring($dateIn,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<u>
			<xsl:value-of select="substring($dateIn,3,2)"/>
		</u>  г. </xsl:template>
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
