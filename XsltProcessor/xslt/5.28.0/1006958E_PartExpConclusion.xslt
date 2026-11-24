<?xml version="1.0" encoding="utf-8"?>
<!-- Проект постановления Правительства РФ "О внесении изменений в постановление Правительства Российской Федерации от 16 февраля 2023 г. № 240" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:pe_conc="urn:customs.ru:CustomsAuditDocuments:PartExpConclusion:5.28.0">
	<!-- Шаблон для типа PartExpConclusionType -->
	<xsl:template match="pe_conc:PartExpConclusion">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					div.page1
					{width: 180mm;
					max-width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;}

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
					font-style: italic;}

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

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					.descr
					{font-size: 8pt;
					text-align: center;}

					.indent
					{text-indent: 1.5em;}

					.underlined
					{border-bottom: 1px solid windowtext;}

					.paragraph
					{text-indent: 5mm;
					text-align: justify;}
				</style>
			</head>
			<body>
				<div class="page1">
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<!--xsl:value-of select="pe_conc:Customs/cat_ru:Code"/>
											<xsl:if test="pe_conc:Customs/cat_ru:OfficeName">
												<xsl:text> </xsl:text-->
												<xsl:value-of select="pe_conc:Customs/cat_ru:OfficeName"/>
											<!--/xsl:if-->
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="3">
										<b>
											<xsl:text>ЗАКЛЮЧЕНИЕ</xsl:text>
											<br/>
											<xsl:text>о результатах мониторинга таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров</xsl:text>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="pe_conc:DocNumber/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:choose>
												<xsl:when test="pe_conc:DocNumber/pe_conc:AddCode">
													<xsl:value-of select="pe_conc:DocNumber/pe_conc:AddCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>210</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="gtd_date">
												<xsl:with-param name="dateIn" select="pe_conc:DocNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="pe_conc:DocNumber/cat_ru:GTDNumber"/>
											<xsl:text>/</xsl:text>
											<xsl:choose>
												<xsl:when test="pe_conc:DocNumber/pe_conc:OperationCode">
													<xsl:value-of select="pe_conc:DocNumber/pe_conc:OperationCode"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>02</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(восьмизначный цифровой код таможенного органа, оформившего настоящее заключение/210/ дата, месяц, последние две цифры года подписания настоящего заключения/буквенное обозначение «З» и шестизначный порядковый номер настоящего заключения с начала каждого года нарастающим итогом начиная с 000001/02)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td class="paragraph">
									<xsl:text>Должностными лицами таможенного органа:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="pe_conc:MonitoringPerson">
												<xsl:value-of select="cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="cat_ru:PersonName"/>
												<xsl:if test="cat_ru:PersonMiddleName">
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonMiddleName"/>
												</xsl:if>
												<xsl:if test="cat_ru:PersonPost">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="cat_ru:PersonPost"/>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<xsl:text>; </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии), должности должностных лиц таможенного органа, проводивших мониторинг сведений, имеющихся в их распоряжении и полученных от лица, участвующего в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>в соответствии с пунктом 10 Положения о проведении эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в данном эксперименте, из систем учета товаров, утвержденного постановлением Правительства Российской Федерации от 16 февраля 2023 г. № 240 «О проведении эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в данном эксперименте, из систем учета товаров» (далее – Положение), на основании решения об участии в эксперименте по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров, принятого в соответствии с пунктом 7 Положения (далее – решение),</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="pe_conc:ApplicationNum"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(регистрационный номер решения)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>проведен мониторинг таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров в отношении:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="pe_conc:ApplicantInfo">
												<xsl:choose>
													<xsl:when test="cat_ru:OrganizationName">
														<xsl:apply-templates select="cat_ru:OrganizationName" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="cat_ru:ShortName" />
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
													<xsl:text> ОГРН: </xsl:text>
													<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN" />
												</xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text> ИНН: </xsl:text>
													<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN" />
												</xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<xsl:text> КПП: </xsl:text>
													<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP" />
												</xsl:if>
												<xsl:if test="RUScat_ru:SubjectAddressDetails">
													<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
														<xsl:for-each select="RUScat_ru:AddressKindCode">
															<xsl:choose>
																<xsl:when test=".='1'">
																	<xsl:text> Адрес регистрации:</xsl:text>
																</xsl:when>
																<xsl:when test=".='2'">
																	<xsl:text> Фактический адрес:</xsl:text>
																</xsl:when>
																<xsl:when test=".='3'">
																	<xsl:text> Почтовый адрес:</xsl:text>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text> (код вида адреса: </xsl:text>
																	<xsl:value-of select="."/>
																	<xsl:text>)</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
														<xsl:choose>
															<xsl:when test="RUScat_ru:AddressText">
																<xsl:if test="RUScat_ru:AddressKindCode">
																	<xsl:text> </xsl:text>
																</xsl:if>
																<xsl:for-each select="RUScat_ru:AddressText">
																	<xsl:value-of select="."/>
																</xsl:for-each>
															</xsl:when>
															<xsl:otherwise>
																<xsl:if test="RUScat_ru:AddressKindCode">
																	<xsl:text> </xsl:text>
																</xsl:if>
																<xsl:for-each select="RUScat_ru:PostalCode">
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:choose>
																	<xsl:when test="RUScat_ru:CounryName">
																		<xsl:for-each select="RUScat_ru:CounryName">
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="."/>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:for-each select="RUScat_ru:CountryCode">
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="."/>
																		</xsl:for-each>
																	</xsl:otherwise>
																</xsl:choose>
																<xsl:for-each select="RUScat_ru:Region">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:District">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:Town">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:City">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:StreetHouse">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:House">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:Room">
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:OKTMO">
																	<xsl:text> ОКТМО: </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:OKATO">
																	<xsl:text> ОКАТО: </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:TerritoryCode">
																	<xsl:text> Код единицы административно - территориального деления: </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
																<xsl:for-each select="RUScat_ru:PostOfficeBoxId">
																	<xsl:text> Номер а/я: </xsl:text>
																	<xsl:value-of select="."/>
																</xsl:for-each>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</xsl:if>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(полное наименование, основной государственный регистрационный номер, индивидуальный номер налогоплательщика, код причины постановки на учет участника эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров, место нахождения и адрес в пределах места нахождения такого участника)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td class="paragraph">
									<xsl:text>В ходе мониторинга таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров несоответствия сведений из системы учета товаров и электронных копий документов сведениям, имеющимся в распоряжении уполномоченного таможенного органа и (или) содержащимся в информационных ресурсах иных федеральных органов исполнительной власти </xsl:text>
									<xsl:choose>
										<xsl:when test="pe_conc:DetectionSign = '0' or pe_conc:DetectionSign = 'false' or pe_conc:DetectionSign = 'f'">
											<u>
												<xsl:text>не выявлены</xsl:text>
											</u>
											<xsl:text>/выявлены</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>не выявлены/</xsl:text>
											<u>
												<xsl:text>выявлены</xsl:text>
											</u>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text> в отношении следующих товаров:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<xsl:for-each select="pe_conc:DetectedGoods/pe_conc:DTInfo">
								<xsl:sort case-order="lower-first" data-type="number" order="ascending" select="position()"/>
								<xsl:choose>
									<xsl:when test="position() = '1'">
										<tr>
											<td>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="position()"/>
														<xsl:text>. </xsl:text>
														<xsl:apply-templates select="pe_conc:GoodsDescription"/>
														<xsl:text>; номер ДТ - </xsl:text>
														<xsl:value-of select="cat_ru:CustomsCode"/>
														<xsl:text>/</xsl:text>
														<xsl:call-template name="gtd_date">
															<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
														</xsl:call-template>
														<xsl:text>/</xsl:text>
														<xsl:value-of select="cat_ru:GTDNumber"/>
														<xsl:if test="pe_conc:GoodsNumeric">
															<xsl:text>; номер товара в ДТ - </xsl:text>
															<xsl:value-of select="pe_conc:GoodsNumeric"/>
														</xsl:if>
														<xsl:if test="pe_conc:Notes">
															<xsl:text>; </xsl:text>
															<xsl:apply-templates select="pe_conc:Notes" />
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование товара, регистрационный номер декларации на товары и номер товара в ней, выявленные несоответствия сведений из системы учета товаров и электронных копий документов сведениям, имеющимся в распоряжении уполномоченного таможенного органа и (или) содержащимся в информационных ресурсах иных федеральных органов исполнительной власти)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="position()"/>
														<xsl:text>. </xsl:text>
														<xsl:apply-templates select="pe_conc:GoodsDescription"/>
														<xsl:text>; номер ДТ - </xsl:text>
														<xsl:value-of select="cat_ru:CustomsCode"/>
														<xsl:text>/</xsl:text>
														<xsl:call-template name="gtd_date">
															<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
														</xsl:call-template>
														<xsl:text>/</xsl:text>
														<xsl:value-of select="cat_ru:GTDNumber"/>
														<xsl:if test="pe_conc:GoodsNumeric">
															<xsl:text>; номер товара в ДТ - </xsl:text>
															<xsl:value-of select="pe_conc:GoodsNumeric"/>
														</xsl:if>
														<xsl:if test="pe_conc:Notes">
															<xsl:text>; </xsl:text>
															<xsl:apply-templates select="pe_conc:Notes" />
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Иные несоответствия:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="pe_conc:DetectedGoods">
												<xsl:apply-templates select="pe_conc:OtherDiscrepancy" />
												<xsl:if test="position()!=last()">
													<xsl:text>; </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Приложение: на _____ листах.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>Должностные лица, проводившие мониторинг таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:for-each select="pe_conc:SigningList">
						<table>
							<tbody>
								<tr>
									<td width="65%" class="value" align="center" valign="bottom">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</xsl:if>
									</td>
									<td width="10%"></td>
									<td width="25%" class="value"></td>
								</tr>
								<tr>
									<td class="descr">
										<xsl:text>(фамилия, имя, отчество (при наличии))</xsl:text>
									</td>
									<td></td>
									<td class="descr">
										<xsl:text>(подпись)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="40%" valign="bottom" rowspan="2">
									<xsl:text>Начальник (лицо, его замещающее) таможенного органа, принявшего настоящее решение, или лица, им уполномоченные</xsl:text>
								</td>
								<td width="2.5%"></td>
								<td width="15%" class="value"></td>
								<td width="2.5%"></td>
								<td width="40%" class="value" align="center" valign="bottom">
									<xsl:apply-templates select="pe_conc:SigningPerson/cat_ru:PersonName" mode="initials"/>
									<xsl:apply-templates select="pe_conc:SigningPerson/cat_ru:PersonMiddleName" mode="initials"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="pe_conc:SigningPerson/cat_ru:PersonSurname"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td class="descr" valign="top">
									<xsl:text>(подпись)</xsl:text>
								</td>
								<td></td>
								<td class="descr" valign="top">
									<xsl:text>(инициалы, фамилия)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="pe_conc:RegDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="$data"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 3, 2)"/>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;
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
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
				<u>
					<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='PartExpConclusion']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()" />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates />
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="." />
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()" />
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath" />
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(.,1, 1),'.')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')" />
		</element>
	</xsl:template>
</xsl:stylesheet>