<?xml version="1.0" encoding="utf-8"?>
<!-- Проект Приказа ФТС России (от 25.02.2019 N 321) "Об утверждении форм заявления лица, внесшего авансовые платежи, о предоставлении отчета о расходовании денежных средств, внесенных в качестве авансовых платежей, отчета о расходовании денежных средств, внесенных в качестве авансовых платежей, порядка подачи лицом, внесшим авансовые платежи, заявления о предоставлении отчета о расходовании денежных средств, внесенных в качестве авансовых платежей, а также порядка предоставления таможенным органом Российской Федерации такого отчета" Приложение №1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cia="urn:customs.ru:Information:ELSDocuments:ELSConfInfoApp:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="cia:ELSConfInfoApp">
		<html>
			<head>
				<title>
					<xsl:text>Заявление лица, внесшего авансовые платежи, о предоставлении отчета о расходовании денежных средств, внесенных в качестве авансовых платежей</xsl:text>
				</title>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div
					{
					white-space: nowrap;
					}

					div.page{
					  width: 200mm;
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
					border: 1px solid black;
					}

					.graphMain {
					font-family: Arial;
					font-size: 11pt;
					}

					.value
					{
					font-family: Arial;
					font-size: 11pt;
					font-style: Italic;
					border-bottom: 1px solid black;
					}

					div.title, tr.title td { font-weight:bold;  }
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

					.graphHeader
					{
					font-family: Arial;
					font-size: 11pt;
					font-weight:bold;
					}

					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}

					.underwrite{
					font-family: Arial;
					font-size: 7pt;
					}

					td.nobordered {
						border-bottom: 0px;
						border-top: 0px;
						border-left: 0px;
						border-right: 0px;
					}

					.delim {
						height: 7pt;
					}

					.underlined {
					border-bottom: 1px solid black;
					}

					.delim_3 {
						height: 3pt;
					}
					
					.inlinetable
					{
					border: 0;
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
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td align="right" width="5%">
													<xsl:text>В </xsl:text>
												</td>
												<td class="value" align="center" width="95%">
													<xsl:apply-templates select="cia:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="graphLittle">
													<xsl:text>(наименование таможенного органа Российской Федерации)</xsl:text>
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
									<font size="4">
										<b>
											<xsl:text>Заявление лица, внесшего авансовые платежи,</xsl:text>
											<br/>
											<xsl:text>о предоставлении отчета о расходовании денежных средств,</xsl:text>
											<br/>
											<xsl:text>внесенных в качестве авансовых платежей</xsl:text>
										</b>
									</font>
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
												<td align="center" width="20%" class="value">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="cia:DocDate"/>
													</xsl:call-template>
												</td>
												<td align="right" width="40%">
													<xsl:text>№ </xsl:text>
												</td>
												<td align="center" width="40%" class="value">
													<xsl:value-of select="cia:DocNumber"/>
												</td>
											</tr>
											<tr>
												<td class="descr">(дата уведомления)</td>
												<td></td>
												<td class="descr">(номер уведомления)</td>
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
								<td align="center" class="value">
									<xsl:apply-templates select="cia:ApplicantInfo" mode="OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<xsl:text>дата рождения физического лица: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cia:ApplicantInfo/cia:BornDate"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(число, месяц, год)'"/>
										<xsl:with-param name="width" select="'50mm'"/>
									</xsl:call-template>
									<br/>
									<xsl:text>документ, удостоверяющий личность физического лица: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardName"/>
											<xsl:if test="not(cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardName)">
												<xsl:value-of select="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:FullIdentityCardName"/>
											</xsl:if>
											<xsl:if test="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardSeries">
												<xsl:text> серия - </xsl:text>
												<xsl:value-of select="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardSeries"/>
											</xsl:if>
											<xsl:if test="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardNumber">
												<xsl:text> номер - </xsl:text>
												<xsl:value-of select="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardNumber"/>
											</xsl:if>
											<xsl:if test="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:CountryCode">
												<xsl:text> страна выдачи - </xsl:text>
												<xsl:value-of select="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:CountryCode"/>
											</xsl:if>
											<xsl:if test="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardDate">
												<xsl:text> дата выдачи - </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cia:ApplicantInfo/cia:IdentityCard/RUScat_ru:IdentityCardDate"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование, серия, номер, страна выдачи, дата выдачи документа)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/>
									<xsl:text>Идентификационный номер налогоплательщика </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="cia:ApplicantInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(для лиц, состоящих на учете в налоговых органах Российской Федерации)'"/>
										<xsl:with-param name="width" select="'80mm'"/>
									</xsl:call-template>
									<br/>
									<xsl:text>или наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="cia:ApplicantInfo/cia:TaxNumber/RUScat_ru:CountryCode">
												<xsl:value-of select="cia:ApplicantInfo/cia:TaxNumber/RUScat_ru:CountryCode"/>
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:text>рег. номер - </xsl:text>
											<xsl:value-of select="cia:ApplicantInfo/cia:TaxNumber/RUScat_ru:UITNCode"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(для лиц, не состоящих на учете в налоговых органах Российской Федерации)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<!--table>
										<tbody>
											<tr>
												<td align="right" width="15%">
													<xsl:text>ИНН *</xsl:text>
												</td>
												<td align="center" class="value" width="30%">
													<xsl:value-of select="cia:ApplicantInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</td>
												<td align="right" width="15%">
													<xsl:text>СНИЛС *</xsl:text>
												</td>
												<td align="center" class="value" width="30%">
													<xsl:value-of select="cia:ApplicantInfo/cia:InsuranceNumber"/>
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
									<table class="graphMain" width="100%">
										<tbody>
											<tr align="center">
												<td width="7%" valign="bottom">
													<xsl:text>Адрес</xsl:text>
												</td>
												<td width="93%" class="value" valign="bottom">
													<xsl:for-each select="cia:ApplicantInfo/cia:Address">
														<xsl:for-each select="*">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:for-each>
													<xsl:if test="cia:ApplicantInfo/cia:FactAddress">
														<xsl:if test="cia:ApplicantInfo/cia:Address">
															<xsl:text>; </xsl:text>
														</xsl:if>
														<xsl:text>Фактический адрес: </xsl:text>
														<xsl:for-each select="cia:ApplicantInfo/cia:FactAddress">
															<xsl:for-each select="*">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="graphLittle">
													<xsl:text>(указывается место нахождения юридического лица; адрес места жительства (проживания) индивидуального предпринимателя или физического лица)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table-->
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>в соответствии со статьей 35 Федерального закона от 3 августа 2018 г. N 289-ФЗ  "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" просит направить</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td width="1%"/>
												<td class="bordered" align="center" width="3%">
													<xsl:choose>
														<xsl:when test="cia:ReportProvidingForm/cia:ReportProvidingFormIndicator='1' or cia:ReportProvidingForm/cia:ReportProvidingFormIndicator='2'">
															<xsl:text>V</xsl:text>
														</xsl:when>
													</xsl:choose>
												</td>
												<td width="2%"/>
												<td width="94%">
													<xsl:text>  в виде документа на бумажном носителе</xsl:text>
												</td>
											</tr>
											<!--tr>
												<td class="value" align="center" colspan="4">
													<xsl:for-each select="cia:ReportProvidingForm/cia:ReportProvidingAddress">
														<xsl:for-each select="*">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:for-each>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="4" align="center" class="graphLittle">
													<xsl:text>(указывается индекс, страна, субъект, район, населенный пункт, улица, дом, корпус, строение, квартира)</xsl:text>
												</td>
											</tr-->
											<tr>
												<td colspan="4" class="delim_3">
													<xsl:text>или</xsl:text>
													<br/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="bordered">
													<xsl:choose>
														<xsl:when test="cia:ReportProvidingForm/cia:ReportProvidingFormIndicator='0' or cia:ReportProvidingForm/cia:ReportProvidingFormIndicator='2'">
															<xsl:text>V</xsl:text>
														</xsl:when>
													</xsl:choose>
												</td>
												<td/>
												<td>
													<xsl:text>  в виде электронного документа через личный кабинет</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="4" class="delim_3"/>
											</tr>
											<tr>
												<td style="text-align: justify" colspan="4">
													<xsl:text>отчет о расходовании денежных средств, внесенных в качестве авансовых платежей, за период с </xsl:text>
													<span class="value">
														<xsl:text>&#160;</xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param select="cia:PeriodBegin" name="dateIn"/>
														</xsl:call-template>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:text> по </xsl:text>
													<span class="value">
														<xsl:text>&#160;</xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param select="cia:PeriodEnd" name="dateIn"/>
														</xsl:call-template>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:text> .</xsl:text>
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
									<xsl:text>Информация для направления корреспонденции:</xsl:text>
									<br/>
									<xsl:text>почтовый адрес </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="cia:ReportProvidingForm/cia:ReportProvidingAddress/RUScat_ru:AddressKindCode = '3'">
													<xsl:value-of select="cia:ReportProvidingForm/cia:ReportProvidingAddress/RUScat_ru:AddressText"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="cia:ApplicantInfo/cia:Address/RUScat_ru:AddressText"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'135mm'"/>
									</xsl:call-template>
									<!--br/>
									<xsl:text>адрес электронной почты </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="cia:ApplicantInfo/cia:Contact/cat_ru:E_mail">
												<xsl:if test="position() != '1'">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'117mm'"/>
									</xsl:call-template-->
									<br/>
									<xsl:text>контактный номер телефона </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="cia:ApplicantInfo/cia:Contact/cat_ru:Phone">
												<xsl:if test="position()!='1'">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'113mm'"/>
									</xsl:call-template>
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
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td class="value" width="45%"/>
												<td width="10%"/>
												<td class="value" width="45%" align="center">
													<xsl:apply-templates mode="personBase" select="cia:ApplicantSignature"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle">
													<xsl:text>(подпись руководителя юридического лица, индивидуального предпринимателя либо физического лица, внесшего авансовые платежи)</xsl:text>
												</td>
												<td/>
												<td valign="top" align="center" class="graphLittle">
													<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
												</td>
											</tr>
											<!--tr>
												<td colspan="3">
													<br/>
													<br/>
												</td>
											</tr>
											<tr>
												<td align="right" colspan="3">
													<xsl:call-template name="text_date">
														<xsl:with-param select="cia:ApplicantSignature/cat_ru:IssueDate" name="date"/>
													</xsl:call-template>
												</td>
											</tr-->
										</tbody>
									</table>
								</td>
							</tr>
							<!--tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<xsl:text>____________________________</xsl:text>
									<br/>
									<br/>
									<xsl:text>* Идентификационный номер налогоплательщика.</xsl:text>
									<br/>
									<xsl:text>** Страховой номер индивидуального лицевого счета указывается в случае подачи обращения физическим лицом.</xsl:text>
								</td>
							</tr-->
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="OrganizationName" match="*">
		<xsl:if test="RUScat_ru:OrganizationName">
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="RUScat_ru:ShortName"/>
			<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="CustomsOffice" match="*">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> (</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
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
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span> г.</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexData"/>
						</sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexDescr"/>
						</sup>
					</td>
				</tr>
			</tbody>
		</table>
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
	<xsl:template match="*" mode="personBase">
		<xsl:apply-templates select="cat_ru:PersonName" mode="initials"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initials"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonSurname"/>
	</xsl:template>
</xsl:stylesheet>
