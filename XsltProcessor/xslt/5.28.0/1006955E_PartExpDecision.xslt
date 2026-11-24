<?xml version="1.0" encoding="utf-8"?>
<!-- Проект постановления Правительства РФ "О внесении изменений в постановление Правительства Российской Федерации от 16 февраля 2023 г. № 240" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:pe_dec="urn:customs.ru:CustomsAuditDocuments:PartExpDecision:5.28.0">
	<!-- Шаблон для типа PartExpDecisionType -->
	<xsl:template match="pe_dec:PartExpDecision">
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
				<xsl:choose>
					<xsl:when test="pe_dec:DocKind='1'">
						<div class="page1">
							<table class="graphMain">
								<tbody>
									<tr>
										<td align="center" class="title">
											<font face="Times new roman" size="3">
												<xsl:text>МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ</xsl:text>
												<br/><br/>
												<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
												<br/>
												<xsl:text>(ФТС РОССИИ)</xsl:text>
											</font>
											<br/><br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<font size="3">
												<b>
													<xsl:text>РЕШЕНИЕ</xsl:text>
													<br/>
													<xsl:text>об участии в эксперименте по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров</xsl:text>
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
													<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:DocNumber/cat_ru:CustomsCode"/>
													<xsl:text>/</xsl:text>
													<xsl:choose>
														<xsl:when test="pe_dec:DecisionDetails/pe_dec:DocNumber/pe_dec:AddCode">
															<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:DocNumber/pe_dec:AddCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>210</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:text>/</xsl:text>
													<xsl:call-template name="gtd_date">
														<xsl:with-param name="dateIn" select="pe_dec:DecisionDetails/pe_dec:DocNumber/cat_ru:RegistrationDate"/>
													</xsl:call-template>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:DocNumber/cat_ru:GTDNumber"/>
													<xsl:text>/</xsl:text>
													<xsl:choose>
														<xsl:when test="pe_dec:DecisionDetails/pe_dec:DocNumber/pe_dec:OperationCode">
															<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:DocNumber/pe_dec:OperationCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>01</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(восьмизначный цифровой код таможенного органа, принявшего настоящее решение/210/день, месяц, последние две цифры года принятия настоящего решения/буквенное обозначение «М» и шестизначный порядковый номер настоящего решения с начала каждого года нарастающим итогом начиная с 000001/01)'"/>
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
											<xsl:text>На основании пункта 7 Положения о проведении эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в данном эксперименте, из систем учета товаров, утвержденного постановлением Правительства Российской Федерации от 16 февраля 2023 г. № 240 «О проведении эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в данном эксперименте, из систем учета товаров» (далее – Положение),</xsl:text>
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
													<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonName"/>
													<xsl:if test="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonMiddleName">
														<xsl:text> </xsl:text>
														<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonMiddleName"/>
													</xsl:if>
													<xsl:if test="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonPost">
														<xsl:text>, </xsl:text>
														<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonPost"/>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии) начальника (лица, его замещающего) таможенного органа, принявшего настоящее решение, или лица, им уполномоченного)'"/>
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
											<xsl:text>РЕШИЛ:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="paragraph">
											<xsl:text>1. </xsl:text>
											<xsl:choose>
												<xsl:when test="pe_dec:DecisionDetails/pe_dec:DecisionSign = '0' or pe_dec:DecisionDetails/pe_dec:DecisionSign = 'false' or pe_dec:DecisionDetails/pe_dec:DecisionSign = 'f'">
													<xsl:text>Провести/</xsl:text>
													<u>
														<xsl:text>не проводить</xsl:text>
													</u>
												</xsl:when>
												<xsl:otherwise>
													<u>
														<xsl:text>Провести</xsl:text>
													</u>
													<xsl:text>/не проводить</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text> мониторинг сведений, имеющихся в распоряжении таможенного органа и полученных от лица, участвующего в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров в отношении:</xsl:text>
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
													<xsl:for-each select="pe_dec:ApplicantInfo">
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
														<xsl:if test="pe_dec:ResultInfo">
															<xsl:text>; </xsl:text>
															<xsl:text>Информация о результатах подключения и тестирования информационного обмена:</xsl:text>
															<xsl:text> </xsl:text>
															<xsl:for-each select="pe_dec:ResultInfo">
																<xsl:value-of select="." />
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:if>
													</xsl:for-each>
													<!--xsl:if test="pe_dec:DecisionDetails/pe_dec:MonitoringDeadline">
														<xsl:text>; Срок, до которого необходимо провести таможенный мониторинг - </xsl:text>
														<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:MonitoringDeadline" mode="russian_date" />
													</xsl:if-->
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(полное наименование, основной государственный регистрационный номер, индивидуальный номер налогоплательщика, код причины постановки на учет участника эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров, место нахождения и адрес в пределах места нахождения такого участника, а также информация о результатах подключения и тестирования информационного обмена)'"/>
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
											<xsl:text>2. Поручить проведение мониторинга таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров уполномоченному таможенному органу:</xsl:text>
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
													<xsl:value-of select="pe_dec:Customs/cat_ru:Code"/>
													<xsl:if test="pe_dec:Customs/cat_ru:OfficeName">
														<xsl:text> </xsl:text>
														<xsl:value-of select="pe_dec:Customs/cat_ru:OfficeName"/>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(код и наименование уполномоченного таможенного органа)'"/>
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
							<br/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="40%" class="value" align="center" valign="bottom">
											<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonPost"/>
										</td>
										<td width="2.5%"></td>
										<td width="15%" class="value"></td>
										<td width="2.5%"></td>
										<td width="40%" class="value" align="center" valign="bottom">
											<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonName" mode="initials"/>
											<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonMiddleName" mode="initials"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:SigningPerson/cat_ru:PersonSurname"/>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(должность должностного лица таможенного органа, принявшего настоящее решение)</xsl:text>
										</td>
										<td></td>
										<td class="descr">
											<xsl:text>(подпись)</xsl:text>
										</td>
										<td></td>
										<td class="descr">
											<xsl:text>(инициалы, фамилия)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="pe_dec:DocKind='2'">
						<div class="page" style="width: {$w}mm;">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>Информация о прекращении участия в эксперименте</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br />
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
									<td class="value graphMain" style="width:50%">
										<xsl:apply-templates select="cat_ru:DocumentID" />
									</td>
								</tr>
							</table>
							<xsl:if test="cat_ru:RefDocumentID">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="cat_ru:RefDocumentID" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="cat_ru:INNSign">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="cat_ru:INNSign" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="cat_ru:MCD_ID">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="cat_ru:MCD_ID" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="pe_dec:Customs">
								<div class="title marg-top">Сведения о таможенном органе, принявшем Решение о проведении таможенного мониторинга</div>
								<div>
									<xsl:apply-templates select="pe_dec:Customs">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="pe_dec:ApplicantInfo">
								<div class="title marg-top">Сведения о лице, в отношении внешнеэкономической деятельности которого необходимо провести таможенный мониторинг</div>
								<div>
									<xsl:apply-templates select="pe_dec:ApplicantInfo">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Дата прекращения участия в эксперименте</td>
									<td class="value graphMain" style="width:50%">
										<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:PartExpTermDate" mode="russian_date" />
									</td>
								</tr>
							</table>
							<xsl:if test="pe_dec:DecisionDetails/pe_dec:PartExpTermCode">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Причина прекращения участия в эксперименте</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="pe_dec:DecisionDetails/pe_dec:PartExpTermCode = '1'">
													<xsl:text>Непредоставление участником эксперимента уполномоченному таможенному органу удаленного доступа к системе учета товаров или сведений из системы учета товаров и (или) электронных копий документов</xsl:text>
												</xsl:when>
												<xsl:when test="pe_dec:DecisionDetails/pe_dec:PartExpTermCode = '2'">
													<xsl:text>Представление участником эксперимента в Федеральную таможенную службу уведомления о прекращении участия в эксперименте</xsl:text>
												</xsl:when>
												<xsl:when test="pe_dec:DecisionDetails/pe_dec:PartExpTermCode = '2'">
													<xsl:text>Присвоение участнику эксперимента высокого уровня риска</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="pe_dec:DecisionDetails/pe_dec:PartExpTermCode" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="pe_dec:DecisionDetails/pe_dec:DecisionReason">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Основания для прекращения участия в эксперименте</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="pe_dec:DecisionDetails/pe_dec:DecisionReason" />
										</td>
									</tr>
								</table>
							</xsl:if>
						</div>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UnifiedCode" />
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CodeListId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CodeListId" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:AEORegistryIdDetailsType -->
	<xsl:template match="RUDECLcat:AEORegistryIdDetails">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:RegistryOwnerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код типа реестра уполномоченных экономических операторов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:RegistryOwnerCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:CountryA2Code" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:DocId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер лица, присвоенный ему при включении в реестр, или регистрационный номер документа о включении лица в реестр</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:DocId" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:AEORegistryKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код типа свидетельства уполномоченного экономического оператора</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:AEORegistryKindCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:ReregistrationCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение признака перерегистрации документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ReregistrationCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:DocKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:DocKindCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:OrganizationType -->
	<xsl:template match="RUScat_ru:SubjectBranch">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ShortName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationLanguage" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryA2Code" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<div class="title marg-top">Адрес</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Fax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер факса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Fax" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Telex" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:E_mail">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:E_mail">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:FullIdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:FullIdentityCardName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardSeries" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardNumber" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:DocValidityDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OrganizationName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IssuerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IssuerCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AuthorityId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AuthorityId" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<div class="title marg-top">
				<xsl:value-of select="position()"/>
			</div>
			<xsl:if test="RUScat_ru:AddressKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вида адреса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="RUScat_ru:AddressKindCode='1'">
									<xsl:text>адрес регистрации</xsl:text>
								</xsl:when>
								<xsl:when test="RUScat_ru:AddressKindCode='2'">
									<xsl:text>фактический адрес</xsl:text>
								</xsl:when>
								<xsl:when test="RUScat_ru:AddressKindCode='3'">
									<xsl:text>почтовый адрес</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="RUScat_ru:AddressKindCode"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostalCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:District"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Town"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Room"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AddressText">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKATO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:KLADR"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOGUID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UITNCode" />
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CategoryCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KATOCode" />
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RNN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ITNReserv" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН / ПИН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KGINN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KGOKPO" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceNumber" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceCertificate" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNP" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RBIdentificationNumber" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OGRN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:INN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KPP" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:BIN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IIN" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа pe_dec:ApplicantInfoType -->
	<xsl:template match="pe_dec:ApplicantInfo">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ShortName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationLanguage" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryA2Code" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PersonId" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<div class="title marg-top">Адрес</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectBranch">
				<div class="title marg-top">Сведения об обособленном подразделении</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:SubjectBranch">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUDECLcat:AEORegistryIdDetails">
				<div class="title marg-top">Номер свидетельства о включении в реестр УЭО</div>
				<div>
					<xsl:apply-templates select="RUDECLcat:AEORegistryIdDetails">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="pe_dec:ResultInfo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Информация о результатах подключения и тестирования информационного обмена</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="pe_dec:ResultInfo">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="pe_dec:Customs">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code" />
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="pe_dec:SigningPerson">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonSurname">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonSurname" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Имя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template match="//*[local-name()='PartExpDecision']//*" priority="-1">
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