<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 22 января 2019 г. № 87 "Об утверждении формы уведомления о возврате (зачете) излишне уплаченных или излишне взысканных сумм таможенных пошлин, налогов и иных платежей,
взимание которых возложено на таможенные органы, а также порядка направления такого уведомления-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdb="urn:customs.ru:Information:CommercialFinanceDocuments:RequestDocumentsToBank:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа RequestDocumentsToBankType -->
	<xsl:template match="rdb:RequestDocumentsToBank">
		<xsl:param name="w" select="180"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}
					
					div
					{white-space: normal;}
					
					div.page
					{margin: 10px auto;
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
					font-style: Italic;}
					
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
					
					.graph
					{font-family: Arial;
					font-size: 10pt;}
					
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
					
					.delim_3
					{height: 3pt;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td width="50%"/>
								<td width="50%">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="rdb:BankInfo/rdb:OrganizationName"/>
											<xsl:if test="rdb:BankInfo/rdb:ShortName">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="rdb:BankInfo/rdb:ShortName"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование банка или иной кредитной организации)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>ИНН - </xsl:text>
											<xsl:apply-templates select="rdb:BankInfo/rdb:INN"/>
											<xsl:text>; КПП - </xsl:text>
											<xsl:apply-templates select="rdb:BankInfo/rdb:KPP"/>
											<xsl:text>; БИК - </xsl:text>
											<xsl:apply-templates select="rdb:BankInfo/rdb:BIC"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(ИНН, КПП, БИК)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="rdb:BankInfo/rdb:Address"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(адрес места нахождения)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="3.5">
										<b>Запрос (требование)<br/>таможенного органа в банк или иную кредитную организацию<br/>о представлении документов и сведений</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr class="indent">
								<td style="text-align: justify">
									<xsl:text>В соответствии с подпунктом 4 пункта 1 статьи 335, пунктом 2 статьи 337, пунктом 8 статьи 340 Таможенного кодекса Евразийского экономического союза, статьей 242 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»</xsl:text>
								</td>
							</tr>
							<tr class="indent">
								<td>
									<xsl:text>в связи с проведением</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="rdb:ReasonForRequest='1'">
													<xsl:text>таможенной проверки</xsl:text>
												</xsl:when>
												<xsl:when test="rdb:ReasonForRequest='2'">
													<xsl:text>проверки таможенных, иных документов и (или) сведений после выпуска товаров</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="rdb:ReasonForRequest"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(таможенной проверки/проверки таможенных, иных документов и (или) сведений после выпуска товаров)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="indent">
								<td>
									<xsl:text>Вам необходимо представить в отношении</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="rdb:VerifiedPerson/rdb:VerifiedPersonYUL">
													<xsl:apply-templates select="rdb:VerifiedPerson/rdb:VerifiedPersonYUL/rdb:OrganizationName"/>
													<xsl:if test="rdb:VerifiedPerson/rdb:VerifiedPersonYUL/rdb:ShortName">
														<xsl:text> (</xsl:text>
														<xsl:apply-templates select="rdb:VerifiedPerson/rdb:VerifiedPersonYUL/rdb:ShortName"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:when>
												<xsl:when test="rdb:VerifiedPerson/rdb:VerifiedPersonFL">
													<xsl:apply-templates select="rdb:VerifiedPerson/rdb:VerifiedPersonFL/rdb:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="rdb:VerifiedPerson/rdb:VerifiedPersonFL/rdb:PersonName"/>
													<xsl:if test="rdb:VerifiedPerson/rdb:VerifiedPersonFL/rdb:PersonMiddleName">
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="rdb:VerifiedPerson/rdb:VerifiedPersonFL/rdb:PersonMiddleName"/>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование организации (фамилия, имя, отчество (при наличии) индивидуального предпринимателя))'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="5%">
													<xsl:choose>
														<xsl:when test="rdb:VerifiedPerson/rdb:INN">
															<xsl:text>ИНН</xsl:text>
														</xsl:when>
														<xsl:when test="rdb:VerifiedPerson/rdb:ForeignOrgCode_Kind='1'">
															<xsl:text>КИО</xsl:text>
														</xsl:when>
														<xsl:when test="rdb:VerifiedPerson/rdb:ForeignOrgCode_Kind='2'">
															<xsl:text>TIN</xsl:text>
														</xsl:when>
														<xsl:when test="rdb:VerifiedPerson/rdb:ForeignOrgCode_Kind='3'">
															<xsl:text>LEI</xsl:text>
														</xsl:when>
														<xsl:when test="rdb:VerifiedPerson/rdb:ForeignOrgCode_Kind='4'">
															<xsl:text>SWIFT</xsl:text>
														</xsl:when>
														<xsl:when test="rdb:VerifiedPerson/rdb:ForeignOrgCode_Kind='5'">
															<xsl:text>NUM</xsl:text>
														</xsl:when>
													</xsl:choose>
												</td>
												<td width="45%" class="value" align="center">
													<xsl:choose>
														<xsl:when test="rdb:VerifiedPerson/rdb:INN">
															<xsl:value-of select="rdb:VerifiedPerson/rdb:INN"/>
														</xsl:when>
														<xsl:when test="rdb:VerifiedPerson/rdb:ForeignOrganizationCode">
															<xsl:value-of select="rdb:VerifiedPerson/rdb:ForeignOrganizationCode"/>
														</xsl:when>
													</xsl:choose>
												</td>
												<td width="5%">
													<xsl:if test="rdb:VerifiedPerson/rdb:KPP">
														<xsl:text>КПП</xsl:text>
													</xsl:if>
												</td>
												<td width="45%" class="value" align="center">
													<xsl:value-of select="rdb:VerifiedPerson/rdb:KPP"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table border="1" width="100%">
						<tbody>
							<tr>
								<td align="center" class="graph">
									<xsl:text>№ п/п</xsl:text>
								</td>
								<td align="center" width="30px" class="graph">
									<xsl:text>1</xsl:text>
								</td>
								<td align="center" class="graph">
									<xsl:text>2</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<xsl:text>1</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='1'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>Справку о наличии счетов у организации (индивидуального предпринимателя)</xsl:text>
									<br/>
									<xsl:text>по состоянию на </xsl:text>
									<xsl:choose>
										<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='1'">
											<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='1']">
												<xsl:call-template name="russian_date_month">
													<xsl:with-param name="dateIn" select="rdb:ReferenceDate"/>
												</xsl:call-template>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>"__" ___________ 20__ г.</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" rowspan="3" class="graph">
									<xsl:text>2</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph"/>
								<td class="graph">
									<xsl:text>Выписку (выписки) по операциям на счете (счетах) организации (индивидуального предпринимателя) и заверенные копии платежных документов, подтверждающих совершение таких операций</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='2' and rdb:RequestedDocuments/rdb:AllAccounts='0'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>1. В отношении следующего счета (счетов):</xsl:text>
									<xsl:choose>
										<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='2' and rdb:RequestedDocuments/rdb:AllAccounts='0'">
											<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='2']">
												<xsl:for-each select="rdb:BankAccount">
													<br/>
													№ <xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:for-each>
											<center class="descr">(указываются номера всех счетов, по которым истребуется выписка (выписки))</center>
										</xsl:when>
										<xsl:otherwise>
											<br/>-
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='2' and rdb:RequestedDocuments/rdb:AllAccounts='0'">
											<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='2']">
												<xsl:for-each select="rdb:Terms">
													<xsl:sort select="rdb:PeriodNumber"/>
													<br/>
													<xsl:text>за период с </xsl:text>
													<u>
														<xsl:text>  </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rdb:BeginDate"/>
														</xsl:call-template>
														<xsl:text>  </xsl:text>
													</u>
													<xsl:text> по </xsl:text>
													<u>
														<xsl:text>  </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rdb:EndDate"/>
														</xsl:call-template>
														<xsl:text>  </xsl:text>
													</u>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<br/><br/>
											<xsl:text>за период с ____________ по ____________</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='2' and rdb:RequestedDocuments/rdb:AllAccounts='1'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>2. В отношении всех открытых указанным лицом счетов</xsl:text>
									<xsl:choose>
										<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='2' and rdb:RequestedDocuments/rdb:AllAccounts='1'">
											<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='2']">
												<xsl:for-each select="rdb:Terms">
													<xsl:sort select="rdb:PeriodNumber"/>
													<br/>
													<xsl:text>за период с </xsl:text>
													<u>
														<xsl:text>  </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rdb:BeginDate"/>
														</xsl:call-template>
														<xsl:text>  </xsl:text>
													</u>
													<xsl:text> по </xsl:text>
													<u>
														<xsl:text>  </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rdb:EndDate"/>
														</xsl:call-template>
														<xsl:text>  </xsl:text>
													</u>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<br/>
											<xsl:text>за период с ____________ по ____________</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<xsl:text>3</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='3'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>Ведомость (ведомости) банковского контроля</xsl:text>
									<br/>
									<xsl:text>по состоянию на </xsl:text>
									<xsl:choose>
										<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='3'">
											<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='3']">
												<xsl:call-template name="russian_date_month">
													<xsl:with-param name="dateIn" select="rdb:ReferenceDate"/>
												</xsl:call-template>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>"__" ___________ 20__ г.</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<xsl:text>4</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='4'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>Заверенные копии паспортов сделок:</xsl:text>
									<br/>
									<table class="graph">
										<tbody>
											<xsl:choose>
												<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='4'">
													<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='4']">
														<xsl:for-each select="rdb:CopiesOfDocuments">
															<tr>
																<td align="center" valign="middle" width="35%">
																	<xsl:apply-templates select="cat_ru:PrDocumentName"/>
																</td>
																<td align="center" valign="middle" width="35%">
																	<xsl:call-template name="russian_date_month">
																		<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
																	</xsl:call-template>
																</td>
																<td align="center" valign="middle" width="30%">
																	<xsl:text>№ </xsl:text>
																	<u>
																		<xsl:text>  </xsl:text>
																		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
																		<xsl:text>  </xsl:text>
																	</u>
																</td>
															</tr>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td align="center" valign="middle" width="10%"/>
														<td align="center" valign="middle" width="45%">
															<xsl:text>"__" ___________ 20__ г.</xsl:text>
														</td>
														<td align="center" valign="middle" width="45%">
															<xsl:text>№ _______________</xsl:text>
														</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<xsl:text>5</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='5'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>Заверенные копии контрактов (договоров) с приложениями и дополнениями:</xsl:text>
									<br/>
									<table class="graph">
										<tbody>
											<xsl:choose>
												<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='5'">
													<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='5']">
														<xsl:for-each select="rdb:SupportingDocuments">
															<tr>
																<td align="center" valign="middle" width="35%">
																	<xsl:apply-templates select="cat_ru:PrDocumentName"/>
																</td>
																<td align="center" valign="middle" width="35%">
																	<xsl:call-template name="russian_date_month">
																		<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
																	</xsl:call-template>
																</td>
																<td align="center" valign="middle" width="30%">
																	<xsl:text>№ </xsl:text>
																	<u>
																		<xsl:text>  </xsl:text>
																		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
																		<xsl:text>  </xsl:text>
																	</u>
																</td>
															</tr>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td align="center" valign="middle" width="10%"/>
														<td align="center" valign="middle" width="45%">
															<xsl:text>"__" ___________ 20__ г.</xsl:text>
														</td>
														<td align="center" valign="middle" width="45%">
															<xsl:text>№ _______________</xsl:text>
														</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<xsl:text>6</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='6'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>Заверенные копии подтверждающих документов (за исключением деклараций на товары):</xsl:text>
									<xsl:choose>
										<xsl:when test="rdb:RequestedDocuments/rdb:DocumentKind='6'">
											<xsl:for-each select="rdb:RequestedDocuments[rdb:DocumentKind='6']">
												<xsl:for-each select="rdb:SupportingDocuments">
													<xsl:if test="position()!=1"><br/></xsl:if>
													<br/>
													<xsl:value-of select="position()"/>
													<xsl:text>. По контракту (договору):</xsl:text>
													<br/>
													<table class="graph">
														<tbody>
															<tr>
																<td align="center" valign="middle" width="35%">
																	<xsl:apply-templates select="cat_ru:PrDocumentName"/>
																</td>
																<td align="center" valign="middle" width="35%">
																	<xsl:call-template name="russian_date_month">
																		<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
																	</xsl:call-template>
																</td>
																<td align="center" valign="middle" width="30%">
																	<xsl:text>№ </xsl:text>
																	<u>
																		<xsl:text>  </xsl:text>
																		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
																		<xsl:text>  </xsl:text>
																	</u>
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:for-each select="rdb:SupportingDocument">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														<xsl:text> от </xsl:text>
														<xsl:call-template name="russian_date_month">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<xsl:text> № </xsl:text>
														<u>
															<xsl:text>  </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
															<xsl:text>  </xsl:text>
														</u>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<br/>
											<xsl:text>1. По контракту (договору):</xsl:text>
											<br/>
											<table class="graph">
												<tbody>
													<tr>
														<td align="center" valign="middle" width="10%"/>
														<td align="center" valign="middle" width="45%">
															<xsl:text>"__" ___________ 20__ г.</xsl:text>
														</td>
														<td align="center" valign="middle" width="45%">
															<xsl:text>№ _______________</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle" class="graph">
									<xsl:text>7</xsl:text>
								</td>
								<td align="center" valign="middle" class="graph">
									<table border="1" style="display:inline; ">
										<tr>
											<td align="center" valign="middle" style="border:0; font:9px">
												<xsl:if test="rdb:RequestedDocuments/rdb:DocumentKind='7'"><font size="2">V</font></xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td class="graph">
									<xsl:text>Заверенные копии карточек с образцами подписей и оттиска печати (при их наличии)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr class="indent">
								<td style="text-align: justify">
									<xsl:text>Данные документы и сведения необходимо представить в течение пяти рабочих дней со дня получения настоящего запроса в </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="rdb:CustomsDetails/cat_ru:OfficeName"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
										<xsl:with-param name="width" select="'120mm'"/>
									</xsl:call-template>
									<xsl:text> по адресу:</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="rdb:CustomsDetails/rdb:Address"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(адрес таможенного органа)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/>
									<xsl:text>или в тот же срок необходимо проинформировать запросивший таможенный орган о том, что банк или иная кредитная организация не располагает запрашиваемыми документами и сведениями.</xsl:text>
								</td>
							</tr>
							<tr class="indent">
								<td style="text-align: justify">
									<xsl:text>Контактный телефон должностного лица таможенного органа: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="rdb:CustomsPersons/rdb:Phone"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'50mm'"/>
										<xsl:with-param name="dot" select="1"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="indent">
								<td style="text-align: justify">
									<xsl:text>Непредставление или несвоевременное представление в государственный орган (должностному лицу), орган (должностному лицу), осуществляющий (осуществляющему) государственный контроль (надзор), сведений (информации), представление которых предусмотрено законом и необходимо для осуществления этим органом (должностным лицом) его законной деятельности, либо представление в государственный орган (должностному лицу), орган (должностному лицу), осуществляющий (осуществляющему) государственный контроль (надзор), таких сведений (информации) в неполном объеме или в искаженном виде влечет ответственность, предусмотренную статьей 19.7 Кодекса Российской Федерации об административных правонарушениях.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="100%" colspan="5">
									Начальник (заместитель начальника)
									<br/>
									таможенного органа
								</td>
							</tr>
							<tr align="center">
								<td width="40%" class="value">
									<xsl:value-of select="rdb:CustomsHeadPersons/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(rdb:CustomsHeadPersons/cat_ru:PersonName,1,1)"/>
									<xsl:text>.</xsl:text>
									<xsl:if test="rdb:CustomsHeadPersons/cat_ru:PersonMiddleName">
										<xsl:value-of select="substring(rdb:CustomsHeadPersons/cat_ru:PersonMiddleName,1,1)"/>
										<xsl:text>.</xsl:text>
									</xsl:if>
								</td>
								<td width="5%"/>
								<td width="25%" class="value"/>
								<td width="5%"/>
								<td width="25%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rdb:CustomsHeadPersons/cat_ru:IssueDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="descr">(фамилия, инициалы имени и отчества (при наличии))</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(дата)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="rdb:BankInfo/rdb:Address | rdb:CustomsDetails/rdb:Address">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код административно - территориальной единицы: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and ((local-name()!='CountryCode') or (local-name()='CountryCode' and not(../cat_ru:CounryName)))">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="rdb:DocCalcPayment">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="rdb:DocKind"/>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
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
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						
						<sup>
							<xsl:value-of select="$supIndexData"/>
						</sup>
						<br/>
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
						<xsl:value-of select="$description" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexDescr"/>
						</sup>
					</td>
					<xsl:if test="$comma != 0 and $list != 0 and $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="rdb:Customs">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:OfficeName"/>
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
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<u>&#160;
				<xsl:value-of select="substring($dateIn,9,2)"/>
				&#160;</u>
				<xsl:text>"&#160;</xsl:text>
				<u>&#160;
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				&#160;</u>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn, 3, 2)"/>
				</u>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
</xsl:stylesheet>
