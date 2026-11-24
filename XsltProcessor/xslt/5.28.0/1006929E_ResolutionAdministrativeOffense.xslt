<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:els_leaf="urn:customs.ru:Information:ELSDocuments:ELSLeafTypes:5.26.0" xmlns:resao="urn:customs.ru:Information:CustomsAuditDocuments:ResolutionAdministrativeOffense:5.26.0">
	<xsl:param name="signatures"/>
	<!-- формат данных в signatures
		<root>
			<cert id="4D2B4C8000010003BFAC" owner="Семенов Виталий Александрович" from="2022-12-06T15:59:18" to="2023-12-05T16:09:18" />
			<cert ... />
		</root>
	-->
	<xsl:include href="ElSign.xslt"/>
	<!-- Шаблон для типа ResolutionAdministrativeOffense -->
	<xsl:template match="resao:ResolutionAdministrativeOffense">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

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

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.descr
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}

					.indent
					{text-indent: 15mm;}

					.delim_3
					{height: 3pt;}

					table.items
					{font-size: 10pt; border-collapse: collapse;}

                    table.items td, table.items th
                    {border: 1px solid black; padding: 2px;}

                    table.items th
                    {background-color: WhiteSmoke;}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА<br/>
									</font>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsFullName='ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА' or resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsCode='10000000'">
									<br/>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td align="center">
											<xsl:variable name="decisionCustCode" select="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsCode"/>
											<xsl:if test="substring($decisionCustCode, string-length($decisionCustCode) - 2) != '000' and resao:OffenceCaseInfo/resao:CaseRegCustomsFullName">
												<xsl:value-of select="resao:OffenceCaseInfo/resao:CaseRegCustomsFullName"/>
												<br/>
											</xsl:if>
											<xsl:value-of select="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsFullName"/>
											<!--xsl:if test="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsFullName and resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsCode">
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsCode"/>
											<xsl:if test="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsFullName and resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsCode">
												<xsl:text>)</xsl:text>
											</xsl:if-->
										</td>
									</tr>
									<!--tr>
										<td class="descr">(наименование таможенного органа)</td>
									</tr-->
								</xsl:otherwise>
							</xsl:choose>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>ПОСТАНОВЛЕНИЕ</b>
									<br/>
									<xsl:choose>
										<xsl:when test="resao:OffenceDecisionInfo[resao:DecisionTypeCode='102060']">
											<b>о назначении административного наказания</b>
										</xsl:when>
										<xsl:when test="resao:OffenceDecisionInfo[resao:DecisionTypeCode='102070' or resao:DecisionTypeCode='102025']">
											<b>о прекращении производства</b>
										</xsl:when>
									</xsl:choose>
									<br/>
									<b>
										<xsl:choose>
											<xsl:when test="count(resao:OffenceCaseInfo/resao:CaseRegNumber) &gt; 1">
												по делам об административных правонарушениях
											</xsl:when>
											<xsl:otherwise>
												по делу об административном правонарушении
											</xsl:otherwise>
										</xsl:choose>
										
									</b>
									<br/>
									<!--b>№ <xsl:value-of select="resao:OffenceDecisionInfo/resao:DecisionNumber"/></b-->
									<xsl:for-each select="resao:OffenceCaseInfo/resao:CaseRegNumber">
										<xsl:if test="position() != 1">, </xsl:if>
										<b>№ <xsl:value-of select="."/></b>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="35%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="resao:OffenceDecisionInfo/resao:DecisionDate"/>
													</xsl:call-template>
												</td>
												<td width="30"/>
												<td width="35%">
													<xsl:value-of select="resao:OffenceDecisionInfo/resao:DecisionPlace"/>
												</td>
											</tr>
											<!--tr>
												<td class="descr">(дата решения)</td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr-->
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify;" class="indent">
									<!--xsl:call-template name="inlinetable">
										<xsl:with-param name="data"-->
											<xsl:for-each select="resao:OffenceDecisionInfo/resao:DecisionPerson">
												<xsl:value-of select="resao:DecisionPersonPostName"/>
												<!--xsl:text> (</xsl:text>
												<xsl:value-of select="resao:DecisionPersonCodePost"/-->
												<xsl:text> </xsl:text>
												<xsl:value-of select="resao:DecisionPersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="resao:DecisionPersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="resao:DecisionPersonMiddleName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="resao:DecisionCustomsFullName"/>
												<!--xsl:text> (</xsl:text>
												<xsl:value-of select="resao:DecisionCustomsCode"/>
												<xsl:text>), </xsl:text>
												<xsl:value-of select="resao:DecisionOrganAdress"/-->
											</xsl:for-each>
										<!--/xsl:with-param>
										<xsl:with-param name="data_align" select="'justify'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество должностного лица, вынесшего постановление, наименование и адрес таможенного органа, в производстве которого находится дело об административном правонарушении)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify"-->
									<xsl:text>, рассмотрев материалы </xsl:text>
										<xsl:choose>
											<xsl:when test="count(resao:OffenceCaseInfo/resao:CaseRegNumber) &gt; 1">
												дел об административных правонарушениях
											</xsl:when>
											<xsl:otherwise>
												дела об административном правонарушении
											</xsl:otherwise>
										</xsl:choose>
									<xsl:text> № </xsl:text>
									<xsl:for-each select="resao:OffenceCaseInfo/resao:CaseRegNumber">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
									<xsl:text> в отношении </xsl:text>
									<!--br/>
									<xsl:if test="resao:Offender/resao:TypeOffender='2' or resao:Offender/resao:TypeOffender='4'">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data"-->
												<xsl:apply-templates select="resao:Offender"/>
												<xsl:text> </xsl:text>
											<!--/xsl:with-param>
											<xsl:with-param name="data_align" select="'justify'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество, дата и место рождения, гражданство, ИНН, номер и серия паспорта, кем и когда выдан, место жительство/место проживания, адрес фактического местонахождения, в т.ч. заграничный: почтовый индекс, наименование страны и населенного пункта, № дома (строения, владения) и квартиры), образование, место работы и должность, контактные номера телефонов (городские/мобильные), электронные почтовые адреса, семейное положение (фамилия, имя, отчество супруга/супруги, наличие иждивенцев и их возраст), финансовое и имущественное положение: размер ежемесячного дохода (в т.ч. супруга/супруги), наличие движимого и недвижимого имущества, находящегося в собственности (в т.ч. супруга/супруги), дополнительный доход (источник и размер), банковские счета, вклады в кредитных и иных финансовых организациях (в т.ч. у супруга/супруги), обязательства финансового характера (алименты, кредиты и т.п.))'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="resao:Offender/resao:TypeOffender='3'">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="resao:Offender"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'justify'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество, дата и место рождения, гражданство, номер и серия паспорта, кем и когда выдан, дата и место его государственной регистрации в качестве индивидуального предпринимателя, коды ОГРНИП, ИНН, КПП, место жительство/место проживания (адрес фактического местонахождения, в т.ч. заграничный: почтовый индекс, наименование страны и населенного пункта, № дома (строения, владения) и квартиры), образование, контактные номера телефонов (городские/мобильные) электронные почтовые адреса, семейное положение (фамилия, имя, отчество супруга/супруги, наличие иждивенцев и их возраст), финансовое и имущественное положение: размер ежемесячного дохода (в т.ч. супруга/супруги), наличие движимого и недвижимого имущества, находящегося в собственности (в т.ч. супруга/супруги), дополнительный доход (источник и размер, в т.ч. супруга/супруги), банковские счета, вклады в кредитных и иных финансовых организациях (в т.ч. у супруга/супруги), обязательства финансового характера (алименты, кредиты и т.п.))'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="resao:Offender/resao:TypeOffender='1'">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="resao:Offender"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'justify'"/>
											<xsl:with-param name="description" select="'(наименование, юридический и фактический адрес, дата государственной регистрации в качестве юридического лица, коды ОГРН/НЗА, ИНН, КПП, ОКПО, страна и место регистрации, регистрационный/налоговый номер в стране регистрации, контактные номера телефонов (городские/мобильные), электронные почтовые адреса, финансовое и имущественное положение: размер дохода; наличие движимого и недвижимого имущества, находящегося в собственности; банковские счета, вклады в кредитных и иных финансовых организациях; обязательства финансового характера (займы, кредиты и т.п.))'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
									<br/-->
									<xsl:choose>
										<xsl:when test="resao:OffenceDecisionInfo[resao:DecisionTypeCode='102060' or resao:DecisionTypeCode='102070' or resao:DecisionTypeCode='102025']">
											<xsl:text>по</xsl:text>
											<xsl:for-each select="resao:OffenceDecisionResolution/resao:KoAPArticle">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:if test="resao:NpaArticleParts">
													<xsl:choose>
														<xsl:when test="count(resao:NpaArticleParts) &gt; 1"> частям </xsl:when>
														<xsl:otherwise> части </xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="resao:NpaArticleParts">
															<xsl:for-each select="resao:NpaArticleParts">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise></xsl:otherwise>
													</xsl:choose>
													<xsl:text> статьи </xsl:text>
												</xsl:if>
												<xsl:if test="not(resao:NpaArticleParts)">
													<xsl:text> статье </xsl:text>
												</xsl:if>
												<xsl:choose>
													<!--xsl:when test="resao:NpaArticle[resao:IsMain='1'] or resao:NpaArticle[resao:IsMain='true']">
															<xsl:for-each select="resao:NpaArticle[resao:IsMain='1']">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
															<xsl:if test="resao:NpaArticle[resao:IsMain='true']">
																<xsl:if test="resao:NpaArticle[resao:IsMain='1']">
																	<xsl:text>, </xsl:text>
																</xsl:if>
																<xsl:for-each select="resao:NpaArticle[resao:IsMain='true']">
																	<xsl:value-of select="resao:NpaNumber"/>
																	<xsl:if test="position()!=last()">
																		<xsl:text>, </xsl:text>
																	</xsl:if>
																</xsl:for-each>
															</xsl:if>
													</xsl:when-->
													<xsl:when test="resao:NpaArticle">
														<!--u>
															<xsl:text> </xsl:text-->
															<xsl:for-each select="resao:NpaArticle">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
															<!--xsl:text> </xsl:text>
														</u-->
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
											&#160;<xsl:text>КоАП РФ,</xsl:text>
										</xsl:when>
										<!--xsl:when test="resao:OffenceDecisionInfo/resao:DecisionTypeCode='102070'">
											<xsl:text>в соответствии с КоАП РФ,</xsl:text>
										</xsl:when-->
									</xsl:choose>
								</td>
							</tr>
							<tr align="center">
								<td>
									<br/>
									<b><xsl:text>УСТАНОВИЛ:</xsl:text></b>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<!--td style="text-align: justify" class="indent"-->
								<td>
									<!--xsl:call-template name="inlinetable">
										<xsl:with-param name="data"-->
											<!--xsl:for-each select="resao:OffenceDecisionInfo/resao:OffenceDescription">
												<xsl:if test="position()!=1">
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each-->
											<!--xsl:text>.</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'justify'"/>
										<xsl:with-param name="description" select="'(излагаются обстоятельства, установленные при рассмотрении дела)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template-->
									<xsl:variable name="OffenceDesription_CustC">
										<xsl:apply-templates select="resao:OffenceDecisionInfo/resao:OffenceDescription"/>
										<!-- в функцию надо сразу содержимое всех элементов -->
									</xsl:variable>
									<xsl:call-template name="replace_p">
										<xsl:with-param name="input" select="$OffenceDesription_CustC"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>На основании изложенного, руководствуясь </xsl:text>
									<xsl:for-each select="resao:OffenceDecisionInfo/*[local-name() = 'SofteningCircumstance' or local-name() = 'AggravatingCircumstances' or local-name() = 'TerminationCircumstances' or local-name() = 'OtherCircumstances']">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:apply-templates select="." mode="circumstance"/>
										<xsl:if test="position() = last()"><xsl:text>, </xsl:text></xsl:if>
									</xsl:for-each>
									<xsl:choose>
										<xsl:when test="not(resao:OffenceDecisionInfo[resao:DecisionTypeCode='102025'])">
											<xsl:text> статьями 29.9,</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text> статьями 28.9,</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text> 29.10 КоАП РФ</xsl:text>
								</td>
							</tr>
							<tr align="center">
								<td>
									<br/>
									<b><xsl:text>ПОСТАНОВИЛ:</xsl:text></b>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<xsl:if test="resao:OffenceDecisionInfo[resao:DecisionTypeCode='102060']">
								<tr>
									<td style="text-align: justify" class="indent">
										<xsl:text>1. Признать </xsl:text>
									<!--/td>
								</tr>
								<tr>
									<td style="text-align: justify">
										<xsl:if test="resao:Offender/resao:TypeOffender='2' or resao:Offender/resao:TypeOffender='4'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data"-->
													<xsl:apply-templates mode="resolution" select="resao:Offender"/>
													<xsl:text> </xsl:text>
												<!--/xsl:with-param>
												<xsl:with-param name="data_align" select="'justify'"/>
												<xsl:with-param name="description" select="'(фамилия, имя, отчество, место жительство или место пребывания, дата и место рождения, место работы, ИНН, номер и серия паспорта, кем и когда выдан)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="resao:Offender/resao:TypeOffender='3'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates mode="resolution" select="resao:Offender"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'justify'"/>
												<xsl:with-param name="description" select="'(фамилия, имя, отчество, место жительство или место пребывания, дата и место рождения, номер и серия паспорта, кем и когда выдан, дата и место его государственной регистрации в качестве индивидуального предпринимателя, коды ОГРНИП, ИНН, КПП)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="resao:Offender/resao:TypeOffender='1'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates mode="resolution" select="resao:Offender"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'justify'"/>
												<xsl:with-param name="description" select="'(наименование, юридический и фактический адрес, дата государственной регистрации в качестве юридического лица, коды ОГРН, ИНН, КПП, ОКПО)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify" class="indent"-->
										<xsl:text>виновным в совершении </xsl:text>
										<xsl:choose>
											<xsl:when test="count(resao:OffenceCaseInfo) &gt; 1"> административных правонарушений </xsl:when>
											<xsl:otherwise> административного правонарушения </xsl:otherwise>
										</xsl:choose>
										<xsl:if test="resao:OffenceCaseInfo/resao:CaseRegNumber">
											<xsl:text> по </xsl:text>
											<xsl:choose>
												<xsl:when test="count(resao:OffenceCaseInfo) &gt; 1"> делам </xsl:when>
												<xsl:otherwise> делу </xsl:otherwise>
											</xsl:choose>
											<xsl:text> об АП </xsl:text>
											<xsl:for-each select="resao:OffenceCaseInfo/resao:CaseRegNumber">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:text> № </xsl:text>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:if>
										<xsl:text>, ответственность за </xsl:text>
										<xsl:choose>
											<xsl:when test="count(resao:OffenceCaseInfo) &gt; 1"> которые </xsl:when>
											<xsl:otherwise> которое </xsl:otherwise>
										</xsl:choose>
										<xsl:text> предусмотрена </xsl:text>
										<xsl:for-each select="resao:OffenceDecisionResolution/resao:KoAPArticle">
											<xsl:if test="position() != 1">, </xsl:if>
											<xsl:if test="resao:NpaArticleParts">
												<xsl:choose>
													<xsl:when test="count(resao:NpaArticleParts) &gt; 1"> частями </xsl:when>
													<xsl:otherwise> частью </xsl:otherwise>
												</xsl:choose>
												<xsl:choose>
														<xsl:when test="resao:NpaArticleParts">
															<xsl:for-each select="resao:NpaArticleParts">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise></xsl:otherwise>
													</xsl:choose>
												<xsl:text> статьи </xsl:text>
											</xsl:if>
											<xsl:if test="not(resao:NpaArticleParts)">
												<xsl:text> статьей </xsl:text>
											</xsl:if>
											<xsl:choose>
												<!--xsl:when test="resao:NpaArticle[resao:IsMain='1'] or resao:NpaArticle[resao:IsMain='true']">
														<xsl:for-each select="resao:NpaArticle[resao:IsMain='1']">
															<xsl:value-of select="resao:NpaNumber"/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="resao:NpaArticle[resao:IsMain='true']">
															<xsl:if test="resao:NpaArticle[resao:IsMain='1']">
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:for-each select="resao:NpaArticle[resao:IsMain='true']">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:if>
												</xsl:when-->
												<xsl:when test="resao:NpaArticle">
														<xsl:for-each select="resao:NpaArticle">
															<xsl:value-of select="resao:NpaNumber"/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
												</xsl:when>
												<xsl:otherwise></xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										&#160;<xsl:text>КоАП РФ</xsl:text>
										<xsl:if test="resao:OffenceDecisionResolution/resao:Punishment">
											<xsl:text>, и назначить ему наказание в виде </xsl:text>
										</xsl:if>
										<!--u>
											<xsl:text> </xsl:text-->
											<xsl:for-each select="resao:OffenceDecisionResolution">
												<xsl:value-of select="resao:Punishment/resao:PunishmentMainName"/>
												<xsl:if test="resao:Punishment/resao:PunishmentMainMeasure">
													<xsl:text> в размере </xsl:text>
														<xsl:value-of select="resao:Punishment/resao:PunishmentMainMeasure/resao:ValueMeasurePunishment"/>
														<!-- в схеме ValueMeasurePunishment и AmountMeasurePunishment разнесены в choice -->
														<xsl:if test="resao:Punishment/resao:PunishmentMainMeasure/resao:AmountMeasurePunishment">
															<xsl:value-of select="translate(translate(format-number(resao:Punishment/resao:PunishmentMainMeasure/resao:AmountMeasurePunishment, '#,###.00'),',',' '),'.',',')"/>
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="resao:Punishment/resao:PunishmentMainMeasure/resao:NameMeasurePunishment"/>
												</xsl:if>
												<xsl:if test="resao:Punishment/resao:PunishmentAdditionalName">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="resao:Punishment/resao:PunishmentAdditionalName"/>
													<xsl:if test="resao:Punishment/resao:PunishmentAdditionalMeasure">
														<xsl:text> в размере </xsl:text>
														<xsl:value-of select="resao:Punishment/resao:PunishmentAdditionalMeasure/resao:ValueMeasurePunishment"/>
														<!-- в схеме ValueMeasurePunishment и AmountMeasurePunishment разнесены в choice -->
														<xsl:if test="resao:Punishment/resao:PunishmentAdditionalMeasure/resao:AmountMeasurePunishment">
															<xsl:value-of select="translate(translate(format-number(resao:Punishment/resao:PunishmentAdditionalMeasure/resao:AmountMeasurePunishment, '#,###.00'),',',' '),'.',',')"/>
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="resao:Punishment/resao:PunishmentAdditionalMeasure/resao:NameMeasurePunishment"/>
													</xsl:if>
												</xsl:if>
												<xsl:if test="position()!=last() and resao:Punishment">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<!--xsl:text> </xsl:text>
										</u-->
										<xsl:text>.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="resao:OffenceDecisionInfo[resao:DecisionTypeCode='102070' or resao:DecisionTypeCode='102025']">
								<tr>
									<td style="text-align: justify" class="indent">
										<xsl:text>1. Производство по делу об административном правонарушении </xsl:text>
										<xsl:for-each select="resao:OffenceCaseInfo">
											<xsl:if test="position() != 1">, </xsl:if>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates select="resao:CaseRegNumber"/>
										</xsl:for-each>
										<xsl:text> в отношении </xsl:text>
										<xsl:apply-templates mode="resolution" select="resao:Offender"/>
										<xsl:text> </xsl:text>
										
									<xsl:text>по</xsl:text>
											<xsl:for-each select="resao:OffenceDecisionResolution/resao:KoAPArticle">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:if test="resao:NpaArticleParts">
													<xsl:choose>
														<xsl:when test="count(resao:NpaArticleParts) &gt; 1"> частям </xsl:when>
														<xsl:otherwise> части </xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="resao:NpaArticleParts">
															<xsl:for-each select="resao:NpaArticleParts">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise></xsl:otherwise>
													</xsl:choose>
													<xsl:text> статьи </xsl:text>
												</xsl:if>
												<xsl:if test="not(resao:NpaArticleParts)">
													<xsl:text> статье </xsl:text>
												</xsl:if>
												<xsl:choose>
													<xsl:when test="resao:NpaArticle">
															<xsl:for-each select="resao:NpaArticle">
																<xsl:value-of select="resao:NpaNumber"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
													</xsl:when>
													<xsl:otherwise></xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										&#160;<xsl:text>КоАП РФ </xsl:text>
										<xsl:text>прекратить на основании </xsl:text>
										<xsl:for-each select="resao:OffenceDecisionInfo/resao:TerminationCircumstances">
											<xsl:if test="resao:CircumstanceDetails[resao:NpaArticleVariety='5']">
												<xsl:text> пункта </xsl:text>
												<!--u>
													<xsl:text> </xsl:text-->
													<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='5']">
														<xsl:value-of select="resao:NpaArticleParts"/>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
													<!--xsl:text> </xsl:text>
												</u-->
											</xsl:if>
											<xsl:if test="not(resao:CircumstanceDetails[resao:NpaArticleVariety='5'])">
												<!--u-->
													<xsl:text>        </xsl:text>
												<!--/u-->
											</xsl:if>
											
											<xsl:if test="resao:CircumstanceDetails[resao:NpaArticleVariety='7']">
												<xsl:text> части </xsl:text>
												<!--u>
													<xsl:text> </xsl:text-->
													<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='7']">
														<xsl:value-of select="resao:NpaArticleParts"/>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
													<!--xsl:text> </xsl:text>
												</u-->
											</xsl:if>
											<xsl:if test="not(resao:CircumstanceDetails[resao:NpaArticleVariety='7'])">
												<!--u-->
													<xsl:text>        </xsl:text>
												<!--/u-->
											</xsl:if>
											<xsl:if test="resao:CircumstanceDetails[resao:NpaArticleVariety='3']">
												<xsl:text> статьи </xsl:text>
												<!--u>
													<xsl:text> </xsl:text-->
													<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='3']">
														<xsl:value-of select="resao:NpaArticleParts"/>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
													<!--xsl:text> </xsl:text>
												</u-->
											</xsl:if>
											<xsl:if test="not(resao:CircumstanceDetails[resao:NpaArticleVariety='3'])">
												<!--u-->
													<xsl:text>        </xsl:text>
												<!--/u-->
											</xsl:if>
											<xsl:text> КоАП РФ</xsl:text>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="resao:OffenceDecisionInfo/resao:TerminationCircumstances/resao:CircumstanceDetails[resao:NpaArticleParts = '2.9' and resao:NpaArticleVariety = 3]">
											<xsl:text> в связи с малозначительностью совершенного административного правонарушения, освободив </xsl:text>
											<xsl:choose>
												<xsl:when test="resao:Offender/resao:OffenderFullName">
													<xsl:apply-templates select="resao:Offender/resao:OffenderFullName"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="resao:Offender">
														<xsl:apply-templates select="resao:OffenderSurname"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="resao:OffenderName"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="resao:OffenderMiddleName"/>
													</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text> от административной ответственности, ограничившись устным замечанием</xsl:text>
										</xsl:if>
										<xsl:text>.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>2. Вещи (товар и/или транспортное средство), изъятые в качестве предмета и/или орудия административного правонарушения, и/или изъятые документы, имеющие значение доказательств по делу об административном правонарушении:</xsl:text>
									<xsl:text> </xsl:text>
									<xsl:if test="not(resao:OffenceDecisionResolution/resao:SeizedGoodsDecision/resao:SeizedGoodsState='1') and not(resao:OffenceDecisionResolution/resao:SeizedGoodsDecision/resao:SeizedGoodsState='true')">
										<xsl:text>отсутствуют.</xsl:text>
									</xsl:if>
									<xsl:for-each select="resao:OffenceDecisionResolution">
										<xsl:for-each select="resao:SeizedGoodsDecision/resao:Goods">
											<xsl:if test="count(.)!=1">
												<br/>
												<xsl:value-of select="position()"/>
												<xsl:text>. </xsl:text>
											</xsl:if>
											<xsl:value-of select="resao:GoodsName"/>
											<!--xsl:text> (</xsl:text>
											<xsl:value-of select="resao:GoodsID"/>
											<xsl:text>)-->
											<xsl:text> в кол-ве </xsl:text>
											<xsl:value-of select="resao:Quantity"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="resao:EdIzmName"/>
											<xsl:if test="position()=last()">
												<xsl:text>.</xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="resao:SeizedGoodsDecision/resao:GoodsDecision">
											<xsl:if test="position()=1">
												<br/>
												<xsl:text>Решения по товарам: </xsl:text>
											</xsl:if>
											<xsl:value-of select="resao:GoodsDecisionName"/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:if test="position()=last()">
												<xsl:text>.</xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>3. Вещи (товар и/или транспортное средство), на которые наложен арест:</xsl:text>
									<xsl:text> </xsl:text>
									<xsl:if test="not(resao:OffenceDecisionResolution/resao:ArrestGoodsDecision/resao:ArrestGoodsState='1') and not(resao:OffenceDecisionResolution/resao:ArrestGoodsDecision/resao:ArrestGoodsState='true')">
										<xsl:text>отсутствуют.</xsl:text>
									</xsl:if>
									<xsl:for-each select="resao:OffenceDecisionResolution">
										<xsl:for-each select="resao:ArrestGoodsDecision/resao:Goods">
											<xsl:if test="count(.)!=1">
												<br/>
												<xsl:value-of select="position()"/>
												<xsl:text>. </xsl:text>
											</xsl:if>
											<xsl:value-of select="resao:GoodsName"/>
											<!--xsl:text> (</xsl:text>
											<xsl:value-of select="resao:GoodsID"/>
											<xsl:text>)--> 
											<xsl:text> в кол-ве </xsl:text>
											<xsl:value-of select="resao:Quantity"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="resao:EdIzmName"/>
											<xsl:if test="position()=last()">
												<xsl:text>.</xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="resao:ArrestGoodsDecision/resao:GoodsDecision">
											<xsl:if test="position()=1">
												<br/>
												<xsl:text>Решения по товарам: </xsl:text>
											</xsl:if>
											<xsl:value-of select="resao:GoodsDecisionName"/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:if test="position()=last()">
												<xsl:text>.</xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>4. Вещественные доказательства:</xsl:text>
									<xsl:text> </xsl:text>
									<xsl:if test="not(resao:OffenceDecisionResolution/resao:PhysicalEvidenceDecision/resao:PhysicalEvidenceState='1') and not(resao:OffenceDecisionResolution/resao:PhysicalEvidenceDecision/resao:PhysicalEvidenceState='true')">
										<xsl:text>отсутствуют.</xsl:text>
									</xsl:if>
									<xsl:for-each select="resao:OffenceDecisionResolution/resao:PhysicalEvidenceDecision">
										<xsl:if test="count(.)!=1">
											<br/>
											<xsl:value-of select="position()"/>
											<xsl:text>. </xsl:text>
										</xsl:if>
										<xsl:if test="resao:PhysicalEvidenceName">
											<xsl:value-of select="resao:PhysicalEvidenceName"/>
										</xsl:if>
										<xsl:for-each select="resao:PhysicalEvidenceDecision">
											<xsl:if test="position()=1">
												<br/>
												<xsl:text>Решения по товарам: </xsl:text>
											</xsl:if>
											<xsl:value-of select="resao:PhysicalEvidenceDecisionName"/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:if test="position()=last()">
												<xsl:text>.</xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>5. Издержки по делу об административном правонарушении:</xsl:text>
									<xsl:text> </xsl:text>
									<xsl:if test="not(resao:OffenceDecisionResolution/resao:CostsDecision/resao:CostsState='1') and not(resao:OffenceDecisionResolution/resao:CostsDecision/resao:CostsState='true')">
										<xsl:text>отсутствуют.</xsl:text>
									</xsl:if>
									<xsl:for-each select="resao:OffenceDecisionResolution/resao:CostsDecision/resao:CostsDetails">
										<xsl:if test="count(.)!=1">
											<br/>
											<xsl:value-of select="position()"/>
											<xsl:text>. </xsl:text>
										</xsl:if>
										<!--xsl:choose>
											<xsl:when test="resao:TypeCostsID='1'">
												<xsl:text>Издержки экспертизы </xsl:text>
											</xsl:when>
											<xsl:when test="resao:TypeCostsID='2'">
												<xsl:text>Издержки хранения </xsl:text>
											</xsl:when>
											<xsl:when test="resao:TypeCostsID='3'">
												<xsl:text>Издержки переводов </xsl:text>
											</xsl:when>
											<xsl:when test="resao:TypeCostsID='4'"-->
												<xsl:value-of select="resao:TypeCosts"/>
											<!--/xsl:when>
										</xsl:choose-->
										<xsl:text> (сумма - </xsl:text>
										<xsl:value-of select="resao:CostsSum"/>
										<xsl:text> руб.)</xsl:text>
										<!--xsl:text>, плательщик - </xsl:text>
										<xsl:choose>
											<xsl:when test="resao:TypeCostsPayerID='1'">
												<xsl:text>субъект АП</xsl:text>
											</xsl:when>
											<xsl:when test="resao:TypeCostsPayerID='2'">
												<xsl:text>федеральный бюджет</xsl:text>
											</xsl:when>
											<xsl:when test="resao:TypeCostsPayerID='3'">
												<xsl:text>бюджет субъекта РФ</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="resao:TypeCostsPayer"/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text>)</xsl:text-->
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
										<xsl:if test="position()=last()">
											<xsl:text>.</xsl:text>
										</xsl:if>
									</xsl:for-each>
									<!--xsl:for-each select="resao:PaymentPropertiesCosts">
										<br/>
										<xsl:if test="resao:SupplierBillID">
											<xsl:text>Уникальный идентификатор начисления - </xsl:text>
											<xsl:value-of select="resao:SupplierBillID"/>
											<xsl:text>; </xsl:text>
										</xsl:if>
										<xsl:if test="resao:Purpose">
											<xsl:text>Назначение платежа - </xsl:text>
											<xsl:value-of select="resao:Purpose"/>
											<xsl:text>; </xsl:text>
										</xsl:if>
										<xsl:if test="resao:TotalAmount">
											<xsl:text>Начисленная сумма - </xsl:text>
											<xsl:value-of select="resao:TotalAmount"/>
											<xsl:text> коп.; </xsl:text>
										</xsl:if>
										<xsl:if test="resao:KBK">
											<xsl:text>Код бюджетной классификации - </xsl:text>
											<xsl:value-of select="resao:KBK"/>
											<xsl:text>; </xsl:text>
										</xsl:if>
										<xsl:if test="resao:OKTMO">
											<xsl:text>Код по ОКТМО получателя - </xsl:text>
											<xsl:value-of select="resao:OKTMO"/>
											<xsl:text>; </xsl:text>
										</xsl:if>
										<xsl:if test="resao:Payee">
											<xsl:text>Сведения о получателе: </xsl:text>
											<xsl:value-of select="resao:Payee/resao:PayeeName"/>
											<xsl:if test="resao:Payee/resao:PayeeINN">
												<xsl:text>, ИНН - </xsl:text>
												<xsl:value-of select="resao:Payee/resao:PayeeINN"/>
											</xsl:if>
											<xsl:if test="resao:Payee/resao:PayeeKPP">
												<xsl:text>, КПП - </xsl:text>
												<xsl:value-of select="resao:Payee/resao:PayeeKPP"/>
											</xsl:if>
											<xsl:if test="resao:Payee/resao:PayeeOGRN">
												<xsl:text>, ОГРН - </xsl:text>
												<xsl:value-of select="resao:Payee/resao:PayeeOGRN"/>
											</xsl:if>
											<xsl:text>, счет получателя - </xsl:text>
											<xsl:value-of select="resao:Payee/resao:PayeeAccountNumber"/>
											<xsl:if test="resao:Payee/resao:PersonalAccount">
												<xsl:text>, лицевой счет - </xsl:text>
												<xsl:value-of select="resao:Payee/resao:PersonalAccount"/>
											</xsl:if>
											<xsl:text>, банк получателя - </xsl:text>
											<xsl:value-of select="resao:Payee/resao:PayeeBank/resao:Name"/>
											<xsl:text> (БИК - </xsl:text>
											<xsl:value-of select="resao:Payee/resao:PayeeBank/resao:BIK"/>
											<xsl:text>, кор. счет - </xsl:text>
											<xsl:value-of select="resao:Payee/resao:PayeeBank/resao:CorrespondentBankAccount"/>
											<xsl:text>); </xsl:text>
										</xsl:if>
										<xsl:if test="resao:BudgetIndex">
											<xsl:text>Реквизиты платежа: статус плательщика - </xsl:text>
											<xsl:value-of select="resao:BudgetIndex/resao:Status"/>
											<xsl:if test="resao:BudgetIndex/resao:PaytReason">
												<xsl:text>, тип платежа - </xsl:text>
												<xsl:value-of select="resao:BudgetIndex/resao:PaytReason"/>
											</xsl:if>
											<xsl:text>, код ТО - </xsl:text>
											<xsl:value-of select="resao:BudgetIndex/resao:TaxPeriod"/>
											<xsl:if test="resao:BudgetIndex/resao:TaxDocNumber">
												<xsl:text>, документ № </xsl:text>
												<xsl:value-of select="resao:BudgetIndex/resao:TaxDocNumber"/>
												<xsl:if test="resao:BudgetIndex/resao:TaxDocDate">
													<xsl:text> от </xsl:text>
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="resao:BudgetIndex/resao:TaxDocDate"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:text>; </xsl:text>
										</xsl:if>
									</xsl:for-each-->
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>В соответствии со статьями 30.1-30.3 КоАП РФ постановление по делу об административном правонарушении может быть обжаловано лицами, указанными в статьях 25.1 - 25.5.1 КоАП РФ, соответственно:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>1) физическими лицами или должностными лицами:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:if test="resao:AppealInfo/resao:HigherCustomsAppealCode != '00'">
										<xsl:text>в вышестоящий таможенный орган (</xsl:text>
										<xsl:value-of select="resao:AppealInfo/resao:HigherCustomsAppealName"/>
										<xsl:text>), находящийся по адресу </xsl:text>
										<xsl:value-of select="resao:AppealInfo/resao:HigherCustomsAppealAdress"/>
										<xsl:text>, либо </xsl:text>
									</xsl:if>
									<xsl:text>в районный суд (</xsl:text>
									<xsl:value-of select="resao:AppealInfo/resao:CourtAppealName"/>
									<xsl:text>), находящийся по адресу </xsl:text>
									<xsl:value-of select="resao:AppealInfo/resao:CourtAppealAdress"/>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>2) юридическими лицами или лицами, осуществляющими предпринимательскую деятельность без образования юридического лица, в случае, если административное правонарушение связано с осуществлением предпринимательской или иной экономической деятельности:</xsl:text>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:if test="resao:AppealInfo/resao:HigherCustomsAppealCode != '00'">
										<xsl:text>в вышестоящий таможенный орган (</xsl:text>
										<xsl:value-of select="resao:AppealInfo/resao:HigherCustomsAppealName"/>
										<xsl:text>), находящийся по адресу </xsl:text>
										<xsl:value-of select="resao:AppealInfo/resao:HigherCustomsAppealAdress"/>
										&#160;<xsl:text>через </xsl:text>
										<xsl:value-of select="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionCustomsFullName"/>
										<xsl:text>, либо </xsl:text>
									</xsl:if>
									<xsl:text>в арбитражный суд в соответствии с арбитражным процессуальным законодательством Российской Федерации.</xsl:text>
								</td>
							</tr>
							<xsl:if test="resao:AppealInfo/resao:HigherCustomsAppealCode != '00'">
								<tr>
									<td style="text-align: justify" class="indent">
										<xsl:text>При обжаловании постановления в вышестоящий таможенный орган или районный суд жалоба может быть подана непосредственно в этот орган или суд.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td style="text-align: justify" class="indent">
									<xsl:text>Жалоба на постановление по делу об административном правонарушении может быть подана в течение 10 дней со дня вручения или получения копии постановления. По истечении этого срока не обжалованное и неопротестованное постановление по делу об административном правонарушении вступает в законную силу и обращается к исполнению. В жалобе может быть указан телефон, по которому лицо уведомляется о дате и времени ее рассмотрения.</xsl:text>
									<br/>
									<br/>
										<xsl:if test="resao:AppealInfo/resao:HigherCustomsAppealCode != '00'">
										<xsl:text>Информация о дате и времени рассмотрения жалобы вышестоящим таможенным органом может быть получена по телефону </xsl:text>
										<xsl:value-of select="resao:AppealInfo/resao:HigherCustomsAppealPhone"/>
										<xsl:text>.</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td>
									<xsl:apply-templates mode="signature0" select="resao:OffenceDecisionInfo/resao:DecisionPerson"/>
								</td>
							</tr>
							<xsl:if test="resao:OffenceDecisionInfo/resao:DecisionTypeCode='102060' and (resao:PaymentPropertiesFine or resao:PaymentPropertiesCosts)">
								<tr>
									<td class="delim_3"><br/></td>
								</tr>
								<tr>
									<td style="text-align: justify" class="indent">
										<xsl:text>В соответствии с частью 1 статьи 32.2 КоАП РФ административный штраф должен быть уплачен в полном размере лицом, привлеченным к административной ответственности, не позднее шестидесяти дней со дня вступления постановления о наложении административного штрафа в законную силу либо со дня истечения срока отсрочки или срока рассрочки, предусмотренных статьей 31.5 КоАП РФ. Административный штраф, назначенный за административное правонарушение, предусмотренное главой 16 или статьей 19.7.13 КоАП РФ, также может быть уплачен иным физическим или юридическим лицом. В случае неуплаты административного штрафа в срок, предусмотренный КоАП РФ, данное лицо может быть привлечено к административной ответственности по части 1 статьи 20.25 КоАП РФ.</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="delim_3"><br/></td>
								</tr>
								<tr>
									<td style="text-align: justify" class="indent">
										<xsl:text>Сумма административного штрафа и издержек по делу об административном правонарушении вносится или перечисляется лицом получателю штрафа и издержек по следующим реквизитам:</xsl:text>
									</td>
								</tr>
								<xsl:if test="resao:PaymentPropertiesFine">
									<tr>
										<td class="delim_3"><br/></td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="80mm" rowspan="5" align="center" valign="middle">
															<xsl:if test="resao:PaymentPropertiesFine/resao:QRCode and string-length(resao:PaymentPropertiesFine/resao:QRCode) != 0">
																<img style="width: 70mm; height: 70mm;" src="{resao:PaymentPropertiesFine/resao:QRCode}"/>
															</xsl:if>
														</td>
														<td width="5%"/>
														<td style="text-align: center">
															<xsl:text>Реквизиты оплаты административного штрафа:</xsl:text>
															<table border="0" cellpadding="3" cellspacing="0" width="100%">
																<tbody>
																	<tr>
																		<td class="graph">
																			<table class="items">
																				<xsl:for-each select="resao:PaymentPropertiesFine/resao:SupplierBillID">
																					<xsl:if test="substring(.,1)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,1,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,2)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,2,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,3)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,3,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,4)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,4,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,5)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,5,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,6)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,6,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,7)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,7,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,8)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,8,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,9)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,9,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,10)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,10,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,11)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,11,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,12)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,12,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,13)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,13,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,14)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,14,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,15)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,15,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,16)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,16,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,17)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,17,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,18)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,18,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,19)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,19,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,20)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,20,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,21)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,21,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,22)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,22,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,23)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,23,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,24)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,24,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,25)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,25,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,26)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,26,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,27)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,27,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,28)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,28,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,29)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,29,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,30)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,30,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,31)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,31,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,32)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,32,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,33)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,33,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,34)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,34,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,35)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,35,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,36)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,36,1)"/>
																						</td>
																					</xsl:if>
																				</xsl:for-each>
																			</table>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
													<tr>
														<td width="5%"/>
														<td class="descr">
															<xsl:text>(уникальный идентификатор начисления для оплаты штрафа)</xsl:text>
														</td>
													</tr>
													<tr>
														<td width="5%"/>
														<td style="text-align: justify">
															<br/>
															<!--u>
																<xsl:text>  </xsl:text-->
																<xsl:text>Назначение платежа - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:Purpose"/>
																<xsl:text>, Начисленная сумма - </xsl:text>
																<xsl:value-of select="translate(translate(format-number(resao:PaymentPropertiesFine/resao:TotalAmount div 100, '#,###.00'),',',' '),'.',',')"/>
																<xsl:text> руб., КБК - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:KBK"/>
																<xsl:text>, Код ОКТМО получателя - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:OKTMO"/>
																<xsl:text>, Наименование получателя - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeName"/>
																<xsl:if test="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeINN">
																	<xsl:text>, ИНН - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeINN"/>
																</xsl:if>
																<xsl:if test="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeKPP">
																	<xsl:text>, КПП - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeKPP"/>
																</xsl:if>
																<xsl:if test="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeOGRN">
																	<xsl:text>, ОГРН - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeOGRN"/>
																</xsl:if>
																<xsl:text>, счет получателя - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeAccountNumber"/>
																<xsl:if test="resao:PaymentPropertiesFine/resao:Payee/resao:PersonalAccount">
																	<xsl:text>, лицевой счет - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PersonalAccount"/>
																</xsl:if>
																<xsl:text>; банк - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeBank/resao:Name"/>
																<xsl:text>, БИК банка - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeBank/resao:BIK"/>
																<xsl:text>, корреспондентский счет - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:Payee/resao:PayeeBank/resao:CorrespondentBankAccount"/>
																<xsl:text>; Реквизиты платежа: </xsl:text>
																<xsl:text> статус плательщика - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:Status"/>
																<xsl:if test="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:PaytReason">
																	<xsl:text>, тип платежа - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:PaytReason"/>
																</xsl:if>
																<xsl:text>, код таможенного органа - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:TaxPeriod"/>
																<xsl:if test="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:TaxDocNumber">
																	<xsl:text>, номер документа - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:TaxDocNumber"/>
																</xsl:if>
																<xsl:if test="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:TaxDocDate">
																	<xsl:text>, дата документа - </xsl:text>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="resao:PaymentPropertiesFine/resao:BudgetIndex/resao:TaxDocDate"/>
																	</xsl:call-template>
																</xsl:if>
															<!--/u-->
														</td>
													</tr>
													<!--tr>
														<td width="5%"/>
														<td class="descr">
															<xsl:text>(информация о получателе штрафа по делу об административном правонарушении, необходимая в соответствии с правилами заполнения расчетных документов на перечисление этих сумм)</xsl:text>
														</td>
													</tr-->
													<xsl:if test="resao:PaymentPropertiesFine/resao:DiscountSize">
														<tr>
															<td width="5%"/>
															<td style="text-align: justify">
																<br/>
																<xsl:text>Административный штраф может быть уплачен с </xsl:text>
																<u>
																	<xsl:value-of select="resao:PaymentPropertiesFine/resao:DiscountSize/resao:Value"/>
																</u>
																<xsl:text>% скидкой в срок до </xsl:text>
																<xsl:call-template name="russian_date_month">
																	<xsl:with-param name="dateIn" select="resao:PaymentPropertiesFine/resao:DiscountSize/resao:Expiry"/>
																</xsl:call-template>
																<xsl:text> Сумма штрафа со скидкой составляет </xsl:text>
																<u>
																	<xsl:value-of select="translate(translate(format-number(resao:PaymentPropertiesFine/resao:TotalAmount * (100 - resao:PaymentPropertiesFine/resao:DiscountSize/resao:Value) div 10000, '#,###.00'),',',' '),'.',',')"/>
																</u>
																<xsl:text> руб.</xsl:text>
																<br/><br/>
																<xsl:text>В соответствии с частью 1.3 статьи 32.2 КоАП РФ административный штраф по делам об АП по  частям 1 - 6 статьи 12.21.1, части 1 статьи 12.21.2, части 2 статьи 12.25 КоАП РФ может быть уплачен не позднее 30 дней со дня вынесения постановления о наложении административного штрафа в размере 75% суммы наложенного административного штрафа, если его уплата не отсрочена и не рассрочена.</xsl:text>
																<br/><br/>
																<xsl:text>В соответствии с частью 1.3-3 статьи 32.2 КоАП РФ административный штраф по делам 
об АП, выявленных в ходе осуществления государственного контроля (надзора), может быть уплачен лицом, привлеченным к административной ответственности за совершение данных АП, либо иным физическим или юридическим лицом не позднее 20 дней со дня вынесения постановления о наложении административного штрафа в размере половины суммы наложенного административного штрафа, если его уплата не отсрочена и не рассрочена.</xsl:text>
															</td>
														</tr>
													</xsl:if>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="resao:PaymentPropertiesCosts">
									<tr>
										<td class="delim_3"><br/></td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="80mm" rowspan="5" align="center" valign="middle">
															<xsl:if test="resao:PaymentPropertiesCosts/resao:QRCode and string-length(resao:PaymentPropertiesCosts/resao:QRCode) != 0">
																<img style="width: 70mm; height: 70mm;" src="{resao:PaymentPropertiesCosts/resao:QRCode}"/>
															</xsl:if>
														</td>
														<td width="5%"/>
														<td style="text-align: center">
															<xsl:text>Реквизиты оплаты издержек:</xsl:text>
															<table border="0" cellpadding="3" cellspacing="0" width="100%">
																<tbody>
																	<tr>
																		<td class="graph">
																			<table class="items">
																				<xsl:for-each select="resao:PaymentPropertiesCosts/resao:SupplierBillID">
																					<xsl:if test="substring(.,1)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,1,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,2)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,2,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,3)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,3,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,4)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,4,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,5)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,5,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,6)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,6,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,7)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,7,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,8)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,8,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,9)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,9,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,10)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,10,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,11)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,11,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,12)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,12,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,13)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,13,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,14)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,14,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,15)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,15,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,16)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,16,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,17)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,17,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,18)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,18,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,19)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,19,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,20)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,20,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,21)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,21,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,22)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,22,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,23)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,23,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,24)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,24,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,25)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,25,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,26)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,26,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,27)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,27,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,28)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,28,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,29)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,29,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,30)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,30,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,31)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,31,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,32)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,32,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,33)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,33,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,34)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,34,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,35)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,35,1)"/>
																						</td>
																					</xsl:if>
																					<xsl:if test="substring(.,36)">
																						<td style="width:2mm">
																							<xsl:value-of select="substring(.,36,1)"/>
																						</td>
																					</xsl:if>
																				</xsl:for-each>
																			</table>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
													<tr>
														<td width="5%"/>
														<td class="descr">
															<xsl:text>(уникальный идентификатор начисления для оплаты издержек)</xsl:text>
														</td>
													</tr>
													<tr>
														<td width="5%"/>
														<td style="text-align: justify">
															<br/>
															<!--u>
																<xsl:text>  </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeName"/>
																<xsl:if test="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeINN">
																	<xsl:text>, ИНН - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeINN"/>
																</xsl:if>
																<xsl:if test="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeKPP">
																	<xsl:text>, КПП - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeKPP"/>
																</xsl:if>
																<xsl:if test="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeOGRN">
																	<xsl:text>, ОГРН - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeOGRN"/>
																</xsl:if>
																<xsl:text>, счет получателя - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeAccountNumber"/>
																<xsl:if test="resao:PaymentPropertiesCosts/resao:Payee/resao:PersonalAccount">
																	<xsl:text>, лицевой счет - </xsl:text>
																	<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PersonalAccount"/>
																</xsl:if>
																<xsl:text>; банк - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeBank/resao:Name"/>
																<xsl:text>, корреспондентский счет - </xsl:text>
																<xsl:value-of select="resao:PaymentPropertiesCosts/resao:Payee/resao:PayeeBank/resao:CorrespondentBankAccount"/-->
																<xsl:for-each select="resao:PaymentPropertiesCosts">
																	<xsl:if test="resao:SupplierBillID">
																		<xsl:text>Уникальный идентификатор начисления - </xsl:text>
																		<xsl:value-of select="resao:SupplierBillID"/>
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																	<xsl:if test="resao:Purpose">
																		<xsl:text>Назначение платежа - </xsl:text>
																		<xsl:value-of select="resao:Purpose"/>
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																	<xsl:if test="resao:TotalAmount">
																		<xsl:text>Начисленная сумма - </xsl:text>
																		<xsl:value-of select="translate(translate(format-number(resao:TotalAmount div 100, '#,###.00'),',',' '),'.',',')"/>
																		<xsl:text> руб.; </xsl:text>
																	</xsl:if>
																	<xsl:if test="resao:KBK">
																		<xsl:text>Код бюджетной классификации - </xsl:text>
																		<xsl:value-of select="resao:KBK"/>
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																	<xsl:if test="resao:OKTMO">
																		<xsl:text>Код по ОКТМО получателя - </xsl:text>
																		<xsl:value-of select="resao:OKTMO"/>
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																	<xsl:if test="resao:Payee">
																		<xsl:text>Сведения о получателе: </xsl:text>
																		<xsl:value-of select="resao:Payee/resao:PayeeName"/>
																		<xsl:if test="resao:Payee/resao:PayeeINN">
																			<xsl:text>, ИНН - </xsl:text>
																			<xsl:value-of select="resao:Payee/resao:PayeeINN"/>
																		</xsl:if>
																		<xsl:if test="resao:Payee/resao:PayeeKPP">
																			<xsl:text>, КПП - </xsl:text>
																			<xsl:value-of select="resao:Payee/resao:PayeeKPP"/>
																		</xsl:if>
																		<xsl:if test="resao:Payee/resao:PayeeOGRN">
																			<xsl:text>, ОГРН - </xsl:text>
																			<xsl:value-of select="resao:Payee/resao:PayeeOGRN"/>
																		</xsl:if>
																		<xsl:text>, счет получателя - </xsl:text>
																		<xsl:value-of select="resao:Payee/resao:PayeeAccountNumber"/>
																		<xsl:if test="resao:Payee/resao:PersonalAccount">
																			<xsl:text>, лицевой счет - </xsl:text>
																			<xsl:value-of select="resao:Payee/resao:PersonalAccount"/>
																		</xsl:if>
																		<xsl:text>, банк получателя - </xsl:text>
																		<xsl:value-of select="resao:Payee/resao:PayeeBank/resao:Name"/>
																		<xsl:text> (БИК - </xsl:text>
																		<xsl:value-of select="resao:Payee/resao:PayeeBank/resao:BIK"/>
																		<xsl:text>, кор. счет - </xsl:text>
																		<xsl:value-of select="resao:Payee/resao:PayeeBank/resao:CorrespondentBankAccount"/>
																		<xsl:text>); </xsl:text>
																	</xsl:if>
																	<xsl:if test="resao:BudgetIndex">
																		<xsl:text>Реквизиты платежа: статус плательщика - </xsl:text>
																		<xsl:value-of select="resao:BudgetIndex/resao:Status"/>
																		<xsl:if test="resao:BudgetIndex/resao:PaytReason">
																			<xsl:text>, тип платежа - </xsl:text>
																			<xsl:value-of select="resao:BudgetIndex/resao:PaytReason"/>
																		</xsl:if>
																		<xsl:text>, код ТО - </xsl:text>
																		<xsl:value-of select="resao:BudgetIndex/resao:TaxPeriod"/>
																		<xsl:if test="resao:BudgetIndex/resao:TaxDocNumber">
																			<xsl:text>, документ № </xsl:text>
																			<xsl:value-of select="resao:BudgetIndex/resao:TaxDocNumber"/>
																			<xsl:if test="resao:BudgetIndex/resao:TaxDocDate">
																				<xsl:text> от </xsl:text>
																				<xsl:call-template name="russian_date">
																					<xsl:with-param name="dateIn" select="resao:BudgetIndex/resao:TaxDocDate"/>
																				</xsl:call-template>
																			</xsl:if>
																		</xsl:if>
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																</xsl:for-each>
																<!--xsl:text>  </xsl:text>
															</u-->
														</td>
													</tr>
													<!--tr>
														<td width="5%"/>
														<td class="descr">
															<xsl:text>(информация о получателе издержек по делу об административном правонарушении, необходимая в соответствии с правилами заполнения расчетных документов на перечисление этих сумм)</xsl:text>
														</td>
													</tr-->
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td><hr/></td>
							</tr>
							<tr>
								<td>
									<xsl:text>Копию настоящего постановления получил </xsl:text>
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="resao:OffenceDecisionDeliveryDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr align="center" valign="bottom">
												<td width="35%"/>
												<td/>
												<td width="20%" class="value"/>
												<td/>
												<td width="35%" class="value">
													<xsl:if test="resao:Offender/resao:OffenderName">
														<xsl:value-of select="substring(resao:Offender/resao:OffenderName,1,1)"/>
														<xsl:text>.</xsl:text>
													</xsl:if>
													<xsl:if test="resao:Offender/resao:OffenderMiddleName">
														<xsl:value-of select="substring(resao:Offender/resao:OffenderMiddleName,1,1)"/>
														<xsl:text>.</xsl:text>
													</xsl:if>
													<xsl:if test="resao:Offender/resao:OffenderSurname">
														<xsl:text> </xsl:text>
														<xsl:value-of select="resao:Offender/resao:OffenderSurname"/>
													</xsl:if>
												</td>
											</tr>
											<tr valign="top">
												<td/>
												<td/>
												<td class="descr">(подпись)</td>
												<td/>
												<td class="descr">(инициалы и фамилия)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>
							<tr>
								<td>
									<xsl:text>Копия настоящего постановления направлена </xsl:text>
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="resao:OffenceDecisionDirectionDate"/>
									</xsl:call-template>
									<br/>
									<xsl:text>исх. № </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="resao:OffenceDecisionDirectionNum"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'30mm'"/>
									</xsl:call-template>
									<xsl:text>&#160;по адресу:</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="resao:OffenceDecisionDirectionAdress"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'justify'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>
							<tr>
								<td>
									<xsl:text>Дата вступления постановления по делу об административном правонарушении в законную силу и выдачи исполнительного документа </xsl:text>
									<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="resao:OffenceDecisionForceDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr align="center" valign="bottom">
												<td width="35%"/>
												<td/>
												<td width="20%" class="value"/>
												<td/>
												<td width="35%" class="value">
													<!--xsl:value-of select="substring(resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionPersonName,1,1)"/>
													<xsl:text>.</xsl:text>
													<xsl:value-of select="substring(resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionPersonMiddleName,1,1)"/>
													<xsl:text>. </xsl:text>
													<xsl:value-of select="resao:OffenceDecisionInfo/resao:DecisionPerson/resao:DecisionPersonSurname"/-->
												</td>
											</tr>
											<tr valign="top">
												<td/>
												<td/>
												<td class="descr">(подпись)</td>
												<td/>
												<td class="descr">(инициалы и фамилия)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="resao:OffenceDecisionInfo/resao:DecisionTypeCode='102060'">
								<tr>
									<td class="delim_3"><br/><br/></td>
								</tr>
								<tr>
									<td>
										<xsl:text>Отметка о неуплате должником назначенного административного штрафа:</xsl:text>
										<br/>
										<xsl:text>по состоянию на </xsl:text>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="resao:MissedPaymentCheckDate"/>
										</xsl:call-template>
										<xsl:text> информация об уплате административного штрафа отсутствует.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Примечание. Копия постановления вручается под расписку физическому лицу, или законному представителю физического лица, или законному представителю юридического лица, в отношении которых оно вынесено, а также потерпевшему по его просьбе либо высылается указанным лицам в течение трех дней со дня вынесения указанного постановления.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<!--xsl:if test="$signatures">
						<xsl:apply-templates select="$signatures/cert" mode="Signature"/>
					</xsl:if-->
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template mode="signature0" match="*">
		<table width="100%">
			<tbody>
				<!--tr align="center" valign="bottom">
					<td width="35%" class="value">
						<xsl:value-of select="resao:DecisionPersonPostName"/>
					</td>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:value-of select="substring(resao:DecisionPersonName,1,1)"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="substring(resao:DecisionPersonMiddleName,1,1)"/>
						<xsl:text>. </xsl:text>
						<xsl:value-of select="resao:DecisionPersonSurname"/>
					</td>
				</tr-->
				<tr align="center" valign="bottom">
					<td width="50%">
						<xsl:value-of select="resao:DecisionPersonPostName"/>
					</td>
					<td width="5%"/>
					<td width="20%">
						<xsl:if test="$signatures">
							<xsl:apply-templates select="$signatures/cert" mode="Signature"/>
						</xsl:if>
					</td>
					<td width="5%"/>
					<td width="20%">
						<xsl:value-of select="substring(resao:DecisionPersonName,1,1)"/>
						<xsl:text>.</xsl:text>
						<xsl:value-of select="substring(resao:DecisionPersonMiddleName,1,1)"/>
						<xsl:text>. </xsl:text>
						<xsl:value-of select="resao:DecisionPersonSurname"/>
					</td>
				</tr>
				<!--tr valign="top">
					<td class="descr">
						<xsl:text>(должность лица, в производстве которого находится дело)</xsl:text>
					</td>
					<td/>
					<td class="descr">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td class="descr">
						<xsl:text>(инициалы и фамилия)</xsl:text>
					</td>
				</tr-->
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="circumstance">
	
		<xsl:if test="resao:CircumstanceDetails[resao:NpaArticleVariety='5']">
			<xsl:text> пункт </xsl:text>
				<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='5']">
					<xsl:value-of select="resao:NpaArticleParts"/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
		</xsl:if>
		
		<xsl:if test="resao:CircumstanceDetails[resao:NpaArticleVariety='7']">
			<xsl:text> часть </xsl:text>
				<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='7']">
					<xsl:value-of select="resao:NpaArticleParts"/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
		</xsl:if>
		
		<xsl:if test="resao:CircumstanceDetails[resao:NpaArticleVariety='3']">
			<xsl:text> статья </xsl:text>
				<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='3']">
					<xsl:value-of select="resao:NpaArticleParts"/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
		</xsl:if>
		
		<!-- так было -->
		<!--xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='1']">
			<xsl:text>, раздел </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='2']">
			<xsl:text>, глава </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='3']">
			<xsl:text>, статья </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='4']">
			<xsl:text>, параграф </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='5']">
			<xsl:text>, пункт </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='6']">
			<xsl:text>, подпункт </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='7']">
			<xsl:text>, часть </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='8']">
			<xsl:text>, абзац </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='9']">
			<xsl:text>, приложение </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each>
		<xsl:for-each select="resao:CircumstanceDetails[resao:NpaArticleVariety='10']">
			<xsl:text>, примечание </xsl:text>
			<xsl:value-of select="resao:NpaArticleParts"/>
		</xsl:for-each-->
	</xsl:template>
	
	<xsl:template mode="resolution" match="*">
		<xsl:if test="resao:TypeOffender='2' or resao:TypeOffender='4'">
			<xsl:choose>
				<xsl:when test="resao:TypeOffender='4'"> должностное лицо </xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="resao:OffenderSurname"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="resao:OffenderName"/>
			<xsl:if test="resao:OffenderMiddleName">
				<xsl:text> </xsl:text>
				<xsl:value-of select="resao:OffenderMiddleName"/>
			</xsl:if>
			<xsl:text> (</xsl:text>
			<xsl:text>место жительства/место проживания - </xsl:text>
			<xsl:value-of select="resao:OffenderAdress"/>
			<xsl:if test="resao:OffenderAdressFakt">
				<xsl:text>; адрес фактического местонахождения - </xsl:text>
				<xsl:value-of select="resao:OffenderAdressFakt"/>
			</xsl:if>
			<xsl:if test="resao:OffenderBirthDate">
				<xsl:text>, дата рождения - </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="resao:OffenderBirthDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="resao:OffenderBirthPlace">
				<xsl:text>, место рождения - </xsl:text>
				<xsl:value-of select="resao:OffenderBirthPlace"/>
			</xsl:if>
			<xsl:if test="resao:OffenderJob">
				<xsl:text>, место работы - </xsl:text>
				<xsl:for-each select="resao:OffenderJob">
					<xsl:if test="position()!=1">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:value-of select="resao:EmployerName"/>
					<xsl:if test="resao:EmployerPostName">
						<xsl:text> - </xsl:text>
						<xsl:value-of select="resao:EmployerPostName"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="resao:OffenderINN">
				<xsl:text>, ИНН - </xsl:text>
				<xsl:value-of select="resao:OffenderINN"/>
			</xsl:if>
			<xsl:text>, гражданство - </xsl:text>
			
			<xsl:value-of select="resao:OffenderCountryName"/>
			<xsl:if test="resao:OffenderDocument">
				<xsl:for-each select="resao:OffenderDocument">
					<xsl:text>; сведения о документе, удостоверяющем личность - </xsl:text>
					<xsl:apply-templates select="resao:TypeDocCode"/>
					<xsl:text> <!--серия: --></xsl:text>
					<xsl:value-of select="resao:SerDoc"/>
					<xsl:text> <!--номер: --></xsl:text>
					<xsl:value-of select="resao:NumDoc"/>
					<xsl:if test="resao:DateDoc">
						<xsl:text>, выдан </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="resao:DateDoc"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="resao:IssuedDoc">
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:IssuedDoc"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="resao:TypeOffender='3'">
			<xsl:text> индивидуального предпринимателя </xsl:text>
			<xsl:value-of select="resao:OffenderSurname"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="resao:OffenderName"/>
			<xsl:if test="resao:OffenderMiddleName">
				<xsl:text> </xsl:text>
				<xsl:value-of select="resao:OffenderMiddleName"/>
			</xsl:if>
			<xsl:text> (</xsl:text>
			<xsl:text>место жительства/место проживания - </xsl:text>
			<xsl:value-of select="resao:OffenderAdress"/>
			<xsl:if test="resao:OffenderAdressFakt">
				<xsl:text>; адрес фактического местонахождения - </xsl:text>
				<xsl:value-of select="resao:OffenderAdressFakt"/>
			</xsl:if>
			<xsl:if test="resao:OffenderBirthDate">
				<xsl:text>, дата рождения - </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="resao:OffenderBirthDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="resao:OffenderBirthPlace">
				<xsl:text>, место рождения - </xsl:text>
				<xsl:value-of select="resao:OffenderBirthPlace"/>
			</xsl:if>
			<xsl:if test="resao:OffenderJob">
				<xsl:text>, место работы - </xsl:text>
				<xsl:for-each select="resao:OffenderJob">
					<xsl:if test="position()!=1">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:value-of select="resao:EmployerName"/>
					<xsl:if test="resao:EmployerPostName">
						<xsl:text> - </xsl:text>
						<xsl:value-of select="resao:EmployerPostName"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!--xsl:if test="resao:OffenderINN">
				<xsl:text>, ИНН - </xsl:text>
				<xsl:value-of select="resao:OffenderINN"/>
			</xsl:if-->
			<xsl:if test="resao:OffenderDocument">
				<xsl:for-each select="resao:OffenderDocument">
					<xsl:text>; сведения о документе, удостоверяющем личность - </xsl:text>
					<xsl:apply-templates select="resao:TypeDocCode"/>
					<xsl:text> <!--серия: --></xsl:text>
					<xsl:value-of select="resao:SerDoc"/>
					<xsl:text> <!--номер: --></xsl:text>
					<xsl:value-of select="resao:NumDoc"/>
					<xsl:if test="resao:DateDoc">
						<xsl:text>, выдан </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="resao:DateDoc"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="resao:IssuedDoc">
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:IssuedDoc"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="resao:OffenderRegDate">
				<xsl:text>, дата государственной регистрации в качестве ИП - </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="resao:OffenderRegDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="resao:OffenderRegPlace">
				<xsl:text>, место государственной регистрации в качестве ИП - </xsl:text>
				<xsl:value-of select="resao:OffenderRegPlace"/>
			</xsl:if>
			<xsl:if test="resao:OffenderOGRN">
				<xsl:text>, ОГРНИП - </xsl:text>
				<xsl:value-of select="resao:OffenderOGRN"/>
			</xsl:if>
			<xsl:if test="resao:OffenderINN">
				<xsl:text>, ИНН - </xsl:text>
				<xsl:value-of select="resao:OffenderINN"/>
			</xsl:if>
			<xsl:if test="resao:OffenderKPP">
				<xsl:text>, КПП - </xsl:text>
				<xsl:value-of select="resao:OffenderKPP"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="resao:TypeOffender='1'">
			<xsl:value-of select="resao:OffenderFullName"/>
			<xsl:text> (</xsl:text>
			<xsl:if test="resao:OffenderRegPlace">
				<xsl:text>юридический адрес - </xsl:text>
				<xsl:value-of select="resao:OffenderRegPlace"/>
			</xsl:if>
			<xsl:if test="resao:OffenderAdressFakt">
				<xsl:if test="resao:OffenderRegPlace">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>фактический адрес - </xsl:text>
				<xsl:value-of select="resao:OffenderAdressFakt"/>
			</xsl:if>
			<xsl:if test="resao:OffenderRegDate">
				<xsl:if test="resao:OffenderRegPlace or resao:OffenderAdressFakt">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>дата государственной регистрации в качестве юридического лица - </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="resao:OffenderRegDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="resao:OffenderOGRN">
				<xsl:if test="resao:OffenderRegPlace or resao:OffenderAdressFakt or resao:OffenderRegDate">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>ОГРН/НЗА - </xsl:text>
				<xsl:value-of select="resao:OffenderOGRN"/>
			</xsl:if>
			<xsl:if test="resao:OffenderINN">
				<xsl:if test="resao:OffenderRegPlace or resao:OffenderAdressFakt or resao:OffenderRegDate or resao:OffenderOGRN">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>ИНН - </xsl:text>
				<xsl:value-of select="resao:OffenderINN"/>
			</xsl:if>
			<xsl:if test="resao:OffenderKPP">
				<xsl:if test="resao:OffenderRegPlace or resao:OffenderAdressFakt or resao:OffenderRegDate or resao:OffenderOGRN or resao:OffenderINN">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>КПП - </xsl:text>
				<xsl:value-of select="resao:OffenderKPP"/>
			</xsl:if>
			<xsl:if test="resao:OffenderOKPO">
				<xsl:if test="resao:OffenderRegPlace or resao:OffenderAdressFakt or resao:OffenderRegDate or resao:OffenderOGRN or resao:OffenderINN or resao:OffenderKPP">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>ОКПО - </xsl:text>
				<xsl:value-of select="resao:OffenderOKPO"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="resao:Offender">
		<xsl:if test="resao:TypeOffender='2' or resao:TypeOffender='4'">
			<xsl:for-each select=".">
				<xsl:choose>
					<xsl:when test="resao:TypeOffender='4'"> должностного лица </xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="resao:OffenderSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="resao:OffenderName"/>
				<xsl:if test="resao:OffenderMiddleName">
					<xsl:text> </xsl:text>
					<xsl:value-of select="resao:OffenderMiddleName"/>
				</xsl:if>
				<xsl:if test="resao:OffenderBirthDate">
					<xsl:text>, дата рождения - </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="resao:OffenderBirthDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="resao:OffenderBirthPlace">
					<xsl:text>, место рождения - </xsl:text>
					<xsl:value-of select="resao:OffenderBirthPlace"/>
				</xsl:if>
				<xsl:text>, гражданство - </xsl:text>
				<xsl:value-of select="resao:OffenderCountryName"/>
				<xsl:if test="resao:OffenderINN">
					<xsl:text>, ИНН - </xsl:text>
					<xsl:value-of select="resao:OffenderINN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderDocument">
					<xsl:for-each select="resao:OffenderDocument">
						<xsl:text>, сведения о документе, удостоверяющем личность - </xsl:text>
						<xsl:apply-templates select="resao:TypeDocCode"/>
						<xsl:text> <!--серия: --></xsl:text>
						<xsl:value-of select="resao:SerDoc"/>
						<xsl:text> <!--номер: --></xsl:text>
						<xsl:value-of select="resao:NumDoc"/>
						<xsl:if test="resao:DateDoc">
							<xsl:text>, выдан </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="resao:DateDoc"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="resao:IssuedDoc">
							<xsl:text> </xsl:text>
							<xsl:value-of select="resao:IssuedDoc"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:text>, место жительства/место проживания - </xsl:text>
				<xsl:value-of select="resao:OffenderAdress"/>
				<xsl:if test="resao:OffenderAdressFakt">
					<xsl:text>, адрес фактического местонахождения - </xsl:text>
					<xsl:value-of select="resao:OffenderAdressFakt"/>
				</xsl:if>
				<xsl:if test="resao:OffenderEducation">
					<xsl:text>, образование - </xsl:text>
					<xsl:for-each select="resao:OffenderEducation">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:choose>
							<xsl:when test=".='1'">
								<xsl:text>высшее</xsl:text>
							</xsl:when>
							<xsl:when test=".='2'">
								<xsl:text>среднее специальное</xsl:text>
							</xsl:when>
							<xsl:when test=".='3'">
								<xsl:text>общее среднее</xsl:text>
							</xsl:when>
							<xsl:when test=".='4'">
								<xsl:text>профессионально-техническое</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderJob">
					<xsl:text>, место работы - </xsl:text>
					<xsl:for-each select="resao:OffenderJob">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:EmployerName"/>
						<xsl:if test="resao:EmployerPostName">
							<xsl:text> - </xsl:text>
							<xsl:value-of select="resao:EmployerPostName"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderPhone">
					<xsl:text>, контактный номер телефона - </xsl:text>
					<xsl:for-each select="resao:OffenderPhone">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderEMail">
					<xsl:text>, электронный почтовый адрес - </xsl:text>
					<xsl:for-each select="resao:OffenderEMail">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderJob/resao:MonthlyIncome">
					<xsl:text>, ежемесячный доход - </xsl:text>
					<xsl:variable name="IncomeSum" select="sum(resao:OffenderJob/resao:MonthlyIncome)"/>
					<xsl:value-of select="$IncomeSum"/>
				</xsl:if>
				<xsl:if test="resao:OffenderAdditionalMonthlyIncome/resao:Size">
					<xsl:text>, дополнительный доход - </xsl:text>
					<xsl:variable name="AddIncomeSum" select="sum(resao:OffenderAdditionalMonthlyIncome/resao:Size)"/>
					<xsl:value-of select="$AddIncomeSum"/>
				</xsl:if>
				<xsl:if test="resao:OffenderTransport">
					<xsl:text>, движимое имущество в собственности - </xsl:text>
					<xsl:for-each select="resao:OffenderRealEstate">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:NaimNedv"/>
						<xsl:text> (кадастровый номер - </xsl:text>
						<xsl:value-of select="resao:kadastrN"/>
						<xsl:text>, адрес - </xsl:text>
						<xsl:value-of select="resao:AddressNedv"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderRealEstate">
					<xsl:text>, недвижимое имущество в собственности - </xsl:text>
					<xsl:for-each select="resao:OffenderTransport">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:AutomType"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:Producer"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:Model"/>
						<xsl:text> (гос. рег. знак - </xsl:text>
						<xsl:value-of select="resao:RegNo"/>
						<xsl:text>, VIN номер - </xsl:text>
						<xsl:value-of select="resao:Vin"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderBankAccount">
					<xsl:text>, банковские счета - </xsl:text>
					<xsl:for-each select="resao:OffenderBankAccount">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:text> № </xsl:text>
						<xsl:value-of select="resao:AccNum"/>
						<xsl:text> (валюта </xsl:text>
						<xsl:value-of select="resao:CurrencyCode"/>
						<xsl:text>, банк - </xsl:text>
						<xsl:value-of select="resao:BankName"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderFinancialObligations">
					<xsl:text>, обязательства финансового характера - </xsl:text>
					<xsl:variable name="FinancialObligations" select="sum(resao:OffenderFinancialObligations/resao:Size)"/>
					<xsl:value-of select="$FinancialObligations"/>
				</xsl:if>
				<!--xsl:text>, </xsl:text>
				<xsl:variable name="Husband1" select="resao:OtherPerson/resao:EnttTypeid='муж' or resao:OtherPerson/resao:EnttTypeid='Муж' or resao:OtherPerson/resao:EnttTypeid='МУЖ'"/>
				<xsl:variable name="Husband2" select="resao:OtherPerson/resao:EnttTypeid='супруг' or resao:OtherPerson/resao:EnttTypeid='Супруг' or resao:OtherPerson/resao:EnttTypeid='СУПРУГ'"/>
				<xsl:variable name="Wife1" select="resao:OtherPerson/resao:EnttTypeid='жена' or resao:OtherPerson/resao:EnttTypeid='Жена' or resao:OtherPerson/resao:EnttTypeid='ЖЕНА'"/>
				<xsl:variable name="Wife2" select="resao:OtherPerson/resao:EnttTypeid='супруга' or resao:OtherPerson/resao:EnttTypeid='Супруга' or resao:OtherPerson/resao:EnttTypeid='СУПРУГА'"/>
				<xsl:if test="resao:OtherPerson">
					<xsl:choose>
						<xsl:when test="$Husband1 or $Husband2">
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='муж']">
								<xsl:text>супруг - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Муж']">
								<xsl:text>супруг - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='МУЖ']">
								<xsl:text>супруг - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='супруг']">
								<xsl:text>супруг - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Супруг']">
								<xsl:text>супруг - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='СУПРУГ']">
								<xsl:text>супруг - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum1"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="$Wife1 or $Wife2">
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='жена']">
								<xsl:text>супруга - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Жена']">
								<xsl:text>супруга - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='ЖЕНА']">
								<xsl:text>супруга - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='супруга']">
								<xsl:text>супруга - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Супруга']">
								<xsl:text>супруга - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='СУПРУГА']">
								<xsl:text>супруга - </xsl:text>
								<xsl:value-of select="resao:EnttFio"/>
								<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
									<xsl:text>, ежемесячный доход - </xsl:text>
									<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
									<xsl:value-of select="$IncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttAdditionalMonthlyIncome">
									<xsl:text>, дополнительный доход - </xsl:text>
									<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
									<xsl:value-of select="$AddIncomeSum2"/>
								</xsl:if>
								<xsl:if test="resao:EnttTransport">
									<xsl:text>, движимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttTransport">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:NaimNedv"/>
										<xsl:text> (кадастровый номер - </xsl:text>
										<xsl:value-of select="resao:kadastrN"/>
										<xsl:text>, адрес - </xsl:text>
										<xsl:value-of select="resao:AddressNedv"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="resao:EnttRealEstate">
									<xsl:text>, недвижимое имущество в собственности - </xsl:text>
									<xsl:for-each select="resao:EnttRealEstate">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="resao:AutomType"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Producer"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="resao:Model"/>
										<xsl:text> (гос. рег. знак - </xsl:text>
										<xsl:value-of select="resao:RegNo"/>
										<xsl:text>, VIN номер - </xsl:text>
										<xsl:value-of select="resao:Vin"/>
										<xsl:text>)</xsl:text>
									</xsl:for-each>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>семейное положение - </xsl:text>
							<xsl:choose>
								<xsl:when test="resao:OffenderGender='1'">
									<xsl:text>не женат</xsl:text>
								</xsl:when>
								<xsl:when test="resao:OffenderGender='2'">
									<xsl:text>не замужем</xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if-->
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="resao:TypeOffender='3'">
			<xsl:text> индивидуального предпринимателя </xsl:text>
			<xsl:for-each select=".">
				<xsl:value-of select="resao:OffenderSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="resao:OffenderName"/>
				<xsl:if test="resao:OffenderMiddleName">
					<xsl:text> </xsl:text>
					<xsl:value-of select="resao:OffenderMiddleName"/>
				</xsl:if>
				<xsl:if test="resao:OffenderBirthDate">
					<xsl:text>, дата рождения - </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="resao:OffenderBirthDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="resao:OffenderBirthPlace">
					<xsl:text>, место рождения - </xsl:text>
					<xsl:value-of select="resao:OffenderBirthPlace"/>
				</xsl:if>
				<xsl:text>, гражданство - </xsl:text>
				<xsl:value-of select="resao:OffenderCountryName"/>
				<xsl:if test="resao:OffenderDocument">
					<xsl:for-each select="resao:OffenderDocument">
						<xsl:text>; сведения о документе, удостоверяющем личность - </xsl:text>
						<xsl:apply-templates select="resao:TypeDocCode"/>
						<xsl:text> <!--серия: --></xsl:text>
						<xsl:value-of select="resao:SerDoc"/>
						<xsl:text> <!--номер: --></xsl:text>
						<xsl:value-of select="resao:NumDoc"/>
						<xsl:if test="resao:DateDoc">
							<xsl:text>, выдан </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="resao:DateDoc"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="resao:IssuedDoc">
							<xsl:text> </xsl:text>
							<xsl:value-of select="resao:IssuedDoc"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderRegDate">
					<xsl:text>, дата государственной регистрации в качестве ИП - </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="resao:OffenderRegDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="resao:OffenderRegPlace">
					<xsl:text>, место государственной регистрации в качестве ИП - </xsl:text>
					<xsl:value-of select="resao:OffenderRegPlace"/>
				</xsl:if>
				<xsl:if test="resao:OffenderOGRN">
					<xsl:text>, ОГРНИП - </xsl:text>
					<xsl:value-of select="resao:OffenderOGRN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderINN">
					<xsl:text>, ИНН - </xsl:text>
					<xsl:value-of select="resao:OffenderINN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderKPP">
					<xsl:text>, КПП - </xsl:text>
					<xsl:value-of select="resao:OffenderKPP"/>
				</xsl:if>
				<xsl:text>, место жительства/место проживания - </xsl:text>
				<xsl:value-of select="resao:OffenderAdress"/>
				<xsl:if test="resao:OffenderAdressFakt">
					<xsl:text>, адрес фактического местонахождения - </xsl:text>
					<xsl:value-of select="resao:OffenderAdressFakt"/>
				</xsl:if>
				<xsl:if test="resao:OffenderEducation">
					<xsl:text>, образование - </xsl:text>
					<xsl:for-each select="resao:OffenderEducation">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="resao:OffenderEducation='1'">
								<xsl:text>высшее</xsl:text>
							</xsl:when>
							<xsl:when test="resao:OffenderEducation='2'">
								<xsl:text>среднее специальное</xsl:text>
							</xsl:when>
							<xsl:when test="resao:OffenderEducation='3'">
								<xsl:text>общее среднее</xsl:text>
							</xsl:when>
							<xsl:when test="resao:OffenderEducation='4'">
								<xsl:text>профессионально-техническое</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderPhone">
					<xsl:text>, контактный номер телефона - </xsl:text>
					<xsl:for-each select="resao:OffenderPhone">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderEMail">
					<xsl:text>, электронный почтовый адрес - </xsl:text>
					<xsl:for-each select="resao:OffenderEMail">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderJob/resao:MonthlyIncome">
					<xsl:text>, ежемесячный доход - </xsl:text>
					<xsl:variable name="IncomeSum" select="sum(resao:OffenderJob/resao:MonthlyIncome)"/>
					<xsl:value-of select="$IncomeSum"/>
				</xsl:if>
				<xsl:if test="resao:OffenderAdditionalMonthlyIncome/resao:Size">
					<xsl:text>, дополнительный доход - </xsl:text>
					<xsl:variable name="AddIncomeSum" select="sum(resao:OffenderAdditionalMonthlyIncome/resao:Size)"/>
					<xsl:value-of select="$AddIncomeSum"/>
				</xsl:if>
				<xsl:if test="resao:OffenderTransport">
					<xsl:text>, движимое имущество в собственности - </xsl:text>
					<xsl:for-each select="resao:OffenderTransport">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:NaimNedv"/>
						<xsl:text> (кадастровый номер - </xsl:text>
						<xsl:value-of select="resao:kadastrN"/>
						<xsl:text>, адрес - </xsl:text>
						<xsl:value-of select="resao:AddressNedv"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderRealEstate">
					<xsl:text>, недвижимое имущество в собственности - </xsl:text>
					<xsl:for-each select="resao:OffenderRealEstate">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:AutomType"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:Producer"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:Model"/>
						<xsl:text> (гос. рег. знак - </xsl:text>
						<xsl:value-of select="resao:RegNo"/>
						<xsl:text>, VIN номер - </xsl:text>
						<xsl:value-of select="resao:Vin"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderBankAccount">
					<xsl:text>, банковские счета - </xsl:text>
					<xsl:for-each select="resao:OffenderBankAccount">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:text> № </xsl:text>
						<xsl:value-of select="resao:AccNum"/>
						<xsl:text> (валюта </xsl:text>
						<xsl:value-of select="resao:CurrencyCode"/>
						<xsl:text>, банк - </xsl:text>
						<xsl:value-of select="resao:BankName"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderFinancialObligations">
					<xsl:text>, обязательства финансового характера - </xsl:text>
					<xsl:variable name="FinancialObligations" select="sum(resao:OffenderFinancialObligations/resao:Size)"/>
					<xsl:value-of select="$FinancialObligations"/>
				</xsl:if>
				<!--xsl:text>, </xsl:text>
				<xsl:variable name="Husband1" select="resao:OtherPerson/resao:EnttTypeid='муж' or resao:OtherPerson/resao:EnttTypeid='Муж' or resao:OtherPerson/resao:EnttTypeid='МУЖ'"/>
				<xsl:variable name="Husband2" select="resao:OtherPerson/resao:EnttTypeid='супруг' or resao:OtherPerson/resao:EnttTypeid='Супруг' or resao:OtherPerson/resao:EnttTypeid='СУПРУГ'"/>
				<xsl:variable name="Wife1" select="resao:OtherPerson/resao:EnttTypeid='жена' or resao:OtherPerson/resao:EnttTypeid='Жена' or resao:OtherPerson/resao:EnttTypeid='ЖЕНА'"/>
				<xsl:variable name="Wife2" select="resao:OtherPerson/resao:EnttTypeid='супруга' or resao:OtherPerson/resao:EnttTypeid='Супруга' or resao:OtherPerson/resao:EnttTypeid='СУПРУГА'"/>
				<xsl:choose>
					<xsl:when test="$Husband1 or $Husband2">
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='муж']">
							<xsl:text>супруг - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Муж']">
							<xsl:text>супруг - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='МУЖ']">
							<xsl:text>супруг - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='супруг']">
							<xsl:text>супруг - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Супруг']">
							<xsl:text>супруг - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='СУПРУГ']">
							<xsl:text>супруг - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum1" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum1" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum1"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:when test="$Wife1 or $Wife2">
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='жена']">
							<xsl:text>супруга - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Жена']">
							<xsl:text>супруга - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='ЖЕНА']">
							<xsl:text>супруга - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='супруга']">
							<xsl:text>супруга - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='Супруга']">
							<xsl:text>супруга - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="resao:OtherPerson[resao:EnttTypeid='СУПРУГА']">
							<xsl:text>супруга - </xsl:text>
							<xsl:value-of select="resao:EnttFio"/>
							<xsl:if test="resao:EnttJob/resao:MonthlyIncome">
								<xsl:text>, ежемесячный доход - </xsl:text>
								<xsl:variable name="IncomeSum2" select="sum(resao:EnttJob/resao:MonthlyIncome)"/>
								<xsl:value-of select="$IncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttAdditionalMonthlyIncome">
								<xsl:text>, дополнительный доход - </xsl:text>
								<xsl:variable name="AddIncomeSum2" select="sum(resao:EnttAdditionalMonthlyIncome/resao:Size)"/>
								<xsl:value-of select="$AddIncomeSum2"/>
							</xsl:if>
							<xsl:if test="resao:EnttTransport">
								<xsl:text>, движимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttTransport">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:NaimNedv"/>
									<xsl:text> (кадастровый номер - </xsl:text>
									<xsl:value-of select="resao:kadastrN"/>
									<xsl:text>, адрес - </xsl:text>
									<xsl:value-of select="resao:AddressNedv"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="resao:EnttRealEstate">
								<xsl:text>, недвижимое имущество в собственности - </xsl:text>
								<xsl:for-each select="resao:EnttRealEstate">
									<xsl:if test="position()!=1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:value-of select="resao:AutomType"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Producer"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="resao:Model"/>
									<xsl:text> (гос. рег. знак - </xsl:text>
									<xsl:value-of select="resao:RegNo"/>
									<xsl:text>, VIN номер - </xsl:text>
									<xsl:value-of select="resao:Vin"/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="resao:OffenderGender">
							<xsl:text>семейное положение - </xsl:text>
							<xsl:choose>
								<xsl:when test="resao:OffenderGender='1'">
									<xsl:text>не женат</xsl:text>
								</xsl:when>
								<xsl:when test="resao:OffenderGender='2'">
									<xsl:text>не замужем</xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose-->
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="resao:TypeOffender='1'">
			<xsl:for-each select=".">
				<xsl:value-of select="resao:OffenderFullName"/>
				<xsl:if test="resao:OffenderRegDate">
					<xsl:text>, дата государственной регистрации в качестве юридического лица - </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="resao:OffenderRegDate"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="resao:OffenderOGRN">
					<xsl:text>, ОГРН/НЗА - </xsl:text>
					<xsl:value-of select="resao:OffenderOGRN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderINN">
					<xsl:text>, ИНН - </xsl:text>
					<xsl:value-of select="resao:OffenderINN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderKPP">
					<xsl:text>, КПП - </xsl:text>
					<xsl:value-of select="resao:OffenderKPP"/>
				</xsl:if>
				<xsl:if test="resao:OffenderOKPO">
					<xsl:text>, ОКПО - </xsl:text>
					<xsl:value-of select="resao:OffenderOKPO"/>
				</xsl:if>
				<!--xsl:text>, страна </xsl:text>
				<xsl:if test="resao:OffenderRegPlace">
					<xsl:text>и место регистрации </xsl:text>
				</xsl:if>
				<xsl:text>- </xsl:text>
				<xsl:if test="resao:OffenderRegPlace">
					<xsl:text> </xsl:text>
					<xsl:value-of select="resao:OffenderRegPlace"/>
				</xsl:if-->
				<xsl:if test="resao:OffenderRegPlace">
					<xsl:text>, юридический адрес - </xsl:text>
					<xsl:value-of select="resao:OffenderRegPlace"/>
				</xsl:if>
				<xsl:if test="resao:OffenderAdressFakt">
					<xsl:text>, фактический адрес - </xsl:text>
					<xsl:value-of select="resao:OffenderAdressFakt"/>
				</xsl:if>
				<xsl:if test="resao:OffenderRN">
					<xsl:text>, рег. номер в стране регистрации - </xsl:text>
					<xsl:value-of select="resao:OffenderRN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderNN">
					<xsl:text>, налог. номер в стране регистрации - </xsl:text>
					<xsl:value-of select="resao:OffenderNN"/>
				</xsl:if>
				<xsl:if test="resao:OffenderPhone">
					<xsl:text>, контактный номер телефона - </xsl:text>
					<xsl:for-each select="resao:OffenderPhone">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderEMail">
					<xsl:text>, электронный почтовый адрес - </xsl:text>
					<xsl:for-each select="resao:OffenderEMail">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderJob/resao:MonthlyIncome">
					<xsl:text>, ежемесячный доход - </xsl:text>
					<xsl:variable name="IncomeSum" select="sum(resao:OffenderJob/resao:MonthlyIncome)"/>
					<xsl:value-of select="$IncomeSum"/>
				</xsl:if>
				<xsl:if test="resao:OffenderAdditionalMonthlyIncome/resao:Size">
					<xsl:text>, дополнительный доход - </xsl:text>
					<xsl:variable name="AddIncomeSum" select="sum(resao:OffenderAdditionalMonthlyIncome/resao:Size)"/>
					<xsl:value-of select="$AddIncomeSum"/>
				</xsl:if>
				<xsl:if test="resao:OffenderTransport">
					<xsl:text>, движимое имущество в собственности - </xsl:text>
					<xsl:for-each select="resao:OffenderTransport">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:NaimNedv"/>
						<xsl:text> (кадастровый номер - </xsl:text>
						<xsl:value-of select="resao:kadastrN"/>
						<xsl:text>, адрес - </xsl:text>
						<xsl:value-of select="resao:AddressNedv"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderRealEstate">
					<xsl:text>, недвижимое имущество в собственности - </xsl:text>
					<xsl:for-each select="resao:OffenderRealEstate">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="resao:AutomType"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:Producer"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="resao:Model"/>
						<xsl:text> (гос. рег. знак - </xsl:text>
						<xsl:value-of select="resao:RegNo"/>
						<xsl:text>, VIN номер - </xsl:text>
						<xsl:value-of select="resao:Vin"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderBankAccount">
					<xsl:text>, банковские счета - </xsl:text>
					<xsl:for-each select="resao:OffenderBankAccount">
						<xsl:if test="position()!=1">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:text> № </xsl:text>
						<xsl:value-of select="resao:AccNum"/>
						<xsl:text> (валюта </xsl:text>
						<xsl:value-of select="resao:CurrencyCode"/>
						<xsl:text>, банк - </xsl:text>
						<xsl:value-of select="resao:BankName"/>
						<xsl:text>)</xsl:text>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="resao:OffenderFinancialObligations">
					<xsl:text>, обязательства финансового характера - </xsl:text>
					<xsl:variable name="FinancialObligations" select="sum(resao:OffenderFinancialObligations/resao:Size)"/>
					<xsl:value-of select="$FinancialObligations"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="resao:TypeDocCode">
		<xsl:choose>
			<xsl:when test=". = '01'">паспорт гражданина Российской Федерации</xsl:when>
			<xsl:when test=". = '02'">свидетельство органов ЗАГС, органа исполнительной власти или органа местного самоуправления о рождении гражданина</xsl:when>
			<xsl:when test=". = '03'">паспорт моряка (удостоверение личности моряка)</xsl:when>
			<xsl:when test=". = '04'">удостоверение личности военнослужащего</xsl:when>
			<xsl:when test=". = '05'">военный билет военнослужащего</xsl:when>
			<xsl:when test=". = '06'">временное удостоверение личности гражданина Российской Федерации</xsl:when>
			<xsl:when test=". = '07'">справка об освобождении из мест лишения свободы</xsl:when>
			<xsl:when test=". = '08'">паспорт иностранного гражданина либо иной документ, установленный федеральным законом или признаваемый в соответствии с международным договором Российской Федерации в качестве документа, удостоверяющего личность иностранного гражданина</xsl:when>
			<xsl:when test=". = '09'">вид на жительство</xsl:when>
			<xsl:when test=". = '10'">разрешение на временное проживание (для лиц без гражданства)</xsl:when>
			<xsl:when test=". = '11'">удостоверение беженца</xsl:when>
			<xsl:when test=". = '12'">миграционная карта</xsl:when>
			<xsl:when test=". = '13'">паспорт гражданина СССР</xsl:when>
			<xsl:when test=". = '14'">страховой номер индивидуального лицевого счета застрахованного лица в системах индивидуального (персонифицированного) учета Фонда пенсионного и социального страхования Российской Федерации (СНИЛС)</xsl:when>
			<xsl:when test=". = '22'">водительское удостоверение</xsl:when>
			<xsl:when test=". = '24'">свидетельство о регистрации транспортного средства в органах Министерства внутренних дел Российской Федерации</xsl:when>
			<xsl:when test=". = '25'">охотничий билет</xsl:when>
			<xsl:when test=". = '26'">разрешение на хранение и ношение охотничьего оружия</xsl:when>
			<xsl:when test=". = '28'">паспорт гражданина Российской Федерации, являющийся основным документом, удостоверяющим личность гражданина Российской Федерации за пределами территории Российской Федерации, в том числе содержащий электронный носитель информации</xsl:when>
			<xsl:when test=". = '29'">свидетельство о предоставлении временного убежища на территории Российской Федерации</xsl:when>
			<xsl:when test=". = '30'">свидетельство о рассмотрении ходатайства по существу</xsl:when>
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
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>«</xsl:text>
				<!--span class="value"-->&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;<!--/span-->
				<xsl:text>» </xsl:text>
				<!--span class="value"-->&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;<!--/span-->
				<xsl:text> 20</xsl:text>
				<!--span class="value"-->
					<xsl:value-of select="substring($dateIn,3,2)"/>
				<!--/span-->
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
						<xsl:value-of select="$data"/>
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
						<xsl:value-of select="$description"/>
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
	<xsl:template name="replace_p">
		<xsl:param name="input" select="''"/>
		<xsl:param name="pref" select="''"/>
		<xsl:if test="string-length($input) &gt; 0">
			<xsl:variable name="beg_p_left" select="'&lt;p left&gt;'"/>
			<xsl:variable name="beg_p_right" select="'&lt;p right&gt;'"/>
			<xsl:variable name="beg_p_center" select="'&lt;p center&gt;'"/>
			<xsl:variable name="beg_p_justify" select="'&lt;p justify&gt;'"/>
			<xsl:variable name="end_p" select="'&lt;/p&gt;'"/>
			<xsl:variable name="beg_str" select="'&lt;s&gt;'"/>
			<xsl:variable name="str_p" select="substring-before(substring-after($input, '&lt;p '), '&gt;')"/>
			<xsl:variable name="align">
				<xsl:choose>
					<xsl:when test="$str_p = 'right' or $str_p = 'center' or $str_p = 'justify'">
						<xsl:value-of select="$str_p"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'left'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="from" select="concat('&lt;p ',$align,'&gt;')"/>
			<xsl:variable name="before_from" select="substring-before($input, $from)"/>
			<xsl:choose>
				<xsl:when test="contains($input, $from)">
					<!--   вывод подстроки предшествующей образцу  + вывод строки замены -->
					<xsl:if test="(string-length($before_from) &gt; 0) and (string-length($pref) &gt; 0)">
						<xsl:value-of select="$pref"/>
					</xsl:if>
					<xsl:value-of select="$before_from"/>
					<xsl:choose>
						<xsl:when test="$from = $beg_p_left or $from = $beg_p_right or $from = $beg_p_center or $from = $beg_p_justify">
							<p style="text-align:{$align};text-indent: 20mm;">
								<xsl:if test="(string-length($before_from) = 0) and (string-length($pref) &gt; 0)">
									<xsl:value-of select="$pref"/>
								</xsl:if>
								<xsl:call-template name="replace_str">
									<xsl:with-param name="input">
										<xsl:choose>
											<xsl:when test="contains(substring-after($input, $from), $end_p)">
												<xsl:value-of select="substring-before(substring-after($input, $from), $end_p)"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring-after($input, $from)"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
									<xsl:with-param name="from" select="$beg_str"/>
								</xsl:call-template>
							</p>
						</xsl:when>
					</xsl:choose>
					<!--   вход в итерацию -->
					<xsl:call-template name="replace_p">
						<!--  в качестве входного параметра задается подстрока после образца замены  -->
						<xsl:with-param name="input" select="substring-after($input, $end_p)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="string-length($pref) &gt; 0">
						<xsl:value-of select="$pref"/>
					</xsl:if>
					<xsl:value-of select="$input"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="replace_str">
		<xsl:param name="input"/>
		<xsl:param name="from"/>
		<xsl:choose>
			<xsl:when test="contains($input, $from)">
				<!--   вывод подстроки предшествующей образцу  + вывод строки замены -->
				<xsl:value-of select="substring-before($input, $from)"/>
				<br/>
				<!--   вход в итерацию -->
				<xsl:call-template name="replace_str">
					<!--  в качестве входного параметра задается подстрока после образца замены  -->
					<xsl:with-param name="input" select="substring-after($input, $from)"/>
					<xsl:with-param name="from" select="$from"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>