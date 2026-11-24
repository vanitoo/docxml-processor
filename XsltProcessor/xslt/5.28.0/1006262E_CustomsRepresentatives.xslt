<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CustRep="urn:customs.ru:Information:CustomsDocuments:CustomsRepresentatives:5.24.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа CustomsRepresentativesType -->
	<xsl:template match="CustRep:CustomsRepresentatives">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
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

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
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
				<xsl:if test="CustRep:RegistryInclusion">
					<div class="page">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>Заявление<br/>о включении в реестр таможенных представителей</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:OrganizationName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/RUScat_ru:BusinessEntityTypeName"/>
							</xsl:with-param>
							<xsl:with-param name="data_align" select="'center'"/>
							<xsl:with-param name="description" select="'(полное фирменное наименование юридического лица с указанием организационно-правовой формы)'"/>
							<xsl:with-param name="width" select="'100%'"/>
						</xsl:call-template>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										просит включить
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:ShortName"/>
							</xsl:with-param>
							<xsl:with-param name="data_align" select="'center'"/>
							<xsl:with-param name="description" select="'(сокращенное наименование юридического лица)'"/>
							<xsl:with-param name="width" select="'100%'"/>
						</xsl:call-template>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										в реестр таможенных представителей.
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										<b>Сведения о юридическом лице</b>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>I. Общие сведения о заявителе</b>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" width="5%" align="center">1</td>
									<td class="bordered" colspan="2" width="40%">Организационно-правовая форма</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/RUScat_ru:BusinessEntityTypeName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">2</td>
									<td class="bordered" colspan="2">Полное фирменное наименование</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:OrganizationName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">3</td>
									<td class="bordered" colspan="2">Сокращенное наименование</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:ShortName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">4</td>
									<td class="bordered" colspan="2">Идентификационный номер налогоплательщика (ИНН)</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">5</td>
									<td class="bordered" colspan="2">Код причины постановки на налоговый учет (КПП)</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">6</td>
									<td class="bordered" colspan="2">Основной государственный регистрационный номер (ОГРН)</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">7</td>
									<td class="bordered" colspan="2">Местонахождение</td>
									<td class="bordered">
										<xsl:apply-templates mode="address" select="CustRep:Applicant/CustRep:LegalEntity/CustRep:FullContactInfo/CustRep:Address"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">8</td>
									<td class="bordered" colspan="2">Почтовый адрес</td>
									<td class="bordered">
										<xsl:apply-templates mode="address" select="CustRep:Applicant/CustRep:LegalEntity/CustRep:FullContactInfo/CustRep:PostalAddress"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">9</td>
									<td class="bordered" colspan="2">Средства связи (телефон, факс, адрес электронной почты)</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:Applicant/CustRep:LegalEntity/CustRep:FullContactInfo/CustRep:CommunicationDetails">
											<xsl:apply-templates mode="details" select="."/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">10</td>
									<td class="bordered" colspan="2">Фамилия, имя, отчество (при наличии) руководителя</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:Applicant/CustRep:LegalEntity/CustRep:OrganisationHead">
											<xsl:value-of select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="cat_ru:PersonMiddleName"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">11</td>
									<td class="bordered" colspan="2">Сведения об учредителях (участниках) (фамилия, имя, отчетство (при наличии) физического лица, наименование юридического лица, ИНН)</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:Applicant/CustRep:LegalEntity/CustRep:Founders/CustRep:Founder">
											<xsl:choose>
												<xsl:when test="CustRep:ParticipationType='01' or CustRep:ParticipationType='1'">Учредитель: </xsl:when>
												<xsl:when test="CustRep:ParticipationType='02' or CustRep:ParticipationType='2'">Участник: </xsl:when>
											</xsl:choose>
											<xsl:value-of select="CustRep:PersonFounder/CustRep:PersonFIO/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="CustRep:PersonFounder/CustRep:PersonFIO/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="CustRep:PersonFounder/CustRep:PersonFIO/cat_ru:PersonMiddleName"/>
											<xsl:if test="CustRep:PersonFounder/CustRep:INN">
												<xsl:text> ИНН </xsl:text>
												<xsl:value-of select="CustRep:PersonFounder/CustRep:INN"/>
											</xsl:if>
											<xsl:value-of select="CustRep:LegalEntityFounder/cat_ru:OrganizationName"/>
											<xsl:if test="CustRep:LegalEntityFounder/cat_ru:RFOrganizationFeatures/cat_ru:INN">
												<xsl:text> ИНН </xsl:text>
												<xsl:value-of select="CustRep:LegalEntityFounder/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">12</td>
									<td class="bordered" colspan="2">Наименование и местонахождение обособленных структурных подразделений, через которые заявитель планирует осуществлять деятельность в качестве таможенного представителя</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:Applicant/CustRep:LegalEntity/CustRep:Filials/CustRep:Filial">
											<xsl:value-of select="cat_ru:OrganizationName"/>
											<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
												<xsl:value-of select="cat_ru:ShortName"/>
											</xsl:if>
											<xsl:if test="CustRep:FilialLocation">
												<xsl:text>, адрес: </xsl:text>
												<xsl:apply-templates mode="address" select="CustRep:FilialLocation"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">13</td>
									<td class="bordered" colspan="2">Код причины постановки на налоговый учет (КПП) обособленных структурных подразделений, через которые заявитель планирует осуществлять деятельность в качестве таможенного представителя</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:Applicant/CustRep:LegalEntity/CustRep:Filials/CustRep:Filial">
											<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>II. Сведения об открытых банковских счетах</b>
									</td>
								</tr>
								<xsl:for-each select="CustRep:Applicant/CustRep:LegalEntity/CustRep:Accounts/CustRep:RurAccount|CustRep:Applicant/CustRep:LegalEntity/CustRep:Accounts/CustRep:ForeignAccount">
									<tr valign="top">
										<td class="bordered" align="center">
											<xsl:value-of select="(position() - 1) * 3 + 1"/>
										</td>
										<td class="bordered" colspan="2">Номер банковского счета</td>
										<td class="bordered">
											<xsl:for-each select="cat_ru:BankAccount">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">
											<xsl:value-of select="(position() - 1) * 3 + 2"/>
										</td>
										<td class="bordered" colspan="2">Дата открытия банковского счета</td>
										<td class="bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="CustRep:OpenAccountDate"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">
											<xsl:value-of select="(position() - 1) * 3 + 3"/>
										</td>
										<td class="bordered" colspan="2">Реквизиты банка (БИК, ИНН)</td>
										<td class="bordered">
											<xsl:if test="cat_ru:BICID">
												<xsl:text>БИК </xsl:text>
												<xsl:value-of select="cat_ru:BICID"/>
											</xsl:if>
											<xsl:if test="CustRep:BankINN">
												<xsl:text> ИНН </xsl:text>
												<xsl:value-of select="CustRep:BankINN"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>III. Сведения об обеспечении исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</b>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">1</td>
									<td class="bordered" colspan="2">Общая сумма обеспечения, руб.</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryInclusion/CustRep:InformationAboutSecuring/CustRep:SupportSum"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">2</td>
									<td class="bordered" colspan="2">Способы обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела</td>
									<td class="bordered"/>
								</tr>
								<xsl:variable name="supportCount" select="count(CustRep:RegistryInclusion/CustRep:InformationAboutSecuring/CustRep:Support)"/>
								<xsl:for-each select="CustRep:RegistryInclusion/CustRep:InformationAboutSecuring/CustRep:Support">
									<tr valign="top">
										<xsl:if test="position() = 1">
											<td class="bordered" rowspan="{$supportCount}"/>
										</xsl:if>
										<td class="bordered" align="center" style="width:10mm;">2.<xsl:value-of select="position()"/>
										</td>
										<td class="bordered">
											<xsl:choose>
												<xsl:when test="CustRep:TypeSupport='01'">Денежный залог; номер и дата платежного поручения</xsl:when>
												<xsl:when test="CustRep:TypeSupport='02'">Банковская гарантия; номер, дата выдачи</xsl:when>
												<xsl:when test="CustRep:TypeSupport='03'">Договор поручительства; номер, дата заключения</xsl:when>
											</xsl:choose>
										</td>
										<td class="bordered">
											<xsl:choose>
												<xsl:when test="CustRep:TypeSupport='01'">
													<xsl:apply-templates mode="docanddate" select="CustRep:CashDepositInfo"/>
												</xsl:when>
												<xsl:when test="CustRep:TypeSupport='02'">
													<xsl:apply-templates mode="docanddate" select="CustRep:BankGuaranteeInfo"/>
												</xsl:when>
												<xsl:when test="CustRep:TypeSupport='03'">
													<xsl:apply-templates mode="docanddate" select="CustRep:ContractOfGuaranteeInfo"/>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
								<tr valign="top">
									<td class="bordered" align="center">3</td>
									<td class="bordered" colspan="2">Регистрационный номер таможенной расписки</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:RegistryInclusion/CustRep:InformationAboutSecuring/CustRep:Support[CustRep:GuaranteeCustomsReceiptNum]">
											<xsl:apply-templates mode="gtd_num" select="CustRep:GuaranteeCustomsReceiptNum"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">4</td>
									<td class="bordered" colspan="2">Дата таможенной расписки</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:RegistryInclusion/CustRep:InformationAboutSecuring/CustRep:Support[CustRep:GuaranteeCustomsReceiptNum]">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="CustRep:GuaranteeCustomsReceiptNum/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>IV. Сведения о договоре (договорах) страхования риска гражданской ответственности таможенного представителя</b>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">1</td>
									<td class="bordered" colspan="2">Номер договора страхования</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:NumInsurance"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">2</td>
									<td class="bordered" colspan="2">Дата заключения договора страхования</td>
									<td class="bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:DateInsurance"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">3</td>
									<td class="bordered" colspan="2">Срок действия договора страхования</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:DateOnInsurance">
											<xsl:text>c </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:DateOnInsurance"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:DateOffInsurance">
											<xsl:text> по </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:DateOffInsurance"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">4</td>
									<td class="bordered" colspan="2">Наименование страховой организации</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:InsuranceCompanyName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">5</td>
									<td class="bordered" colspan="2">Номер и дата выдачи лицензии на право страхования отвественности таможенных представителей</td>
									<td class="bordered">
										<xsl:apply-templates mode="document" select="CustRep:RegistryInclusion/CustRep:RiskInsurance/CustRep:LiabilityInsurance"/>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>V. Сведения об ограничениях сферы деятельности в качестве таможенного представителя</b>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">1</td>
									<td class="bordered" colspan="2">
										Совершение таможенных операций в отношении отдельных категоний товаров
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryInclusion/CustRep:LimitsData/CustRep:KindLimitData=1">
											&#10004;<br/>
											<xsl:apply-templates mode="limitData" select="CustRep:RegistryInclusion/CustRep:LimitsData/CustRep:LimitData"/>
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">2</td>
									<td class="bordered" colspan="2">
										Совершение таможенных операций в отношении товаров, не облагаемых вывозными таможенными пошлинами и помещаемых под таможенную процедуру экспорта
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryInclusion/CustRep:LimitsData/CustRep:KindLimitData=2">
											&#10004;
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">3</td>
									<td class="bordered" colspan="2">
										Совершение таможенных операций в отдельном регионе деятельности таможенного органа
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryInclusion/CustRep:LimitsData/CustRep:KindLimitData=3">
											&#10004;<br/>
											<xsl:apply-templates mode="limitData" select="CustRep:RegistryInclusion/CustRep:LimitsData/CustRep:LimitData"/>
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">4</td>
									<td class="bordered" colspan="2">
										Осуществление деятельности без ограничений
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryInclusion/CustRep:LimitsData/CustRep:KindLimitData=4">
											&#10004;
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td width="50%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates mode="person" select="CustRep:Applicant/CustRep:SigningDetails"/>
									</td>
									<td/>
									<td width="25%" style="border-bottom: 1px solid black;"/>
								</tr>
								<tr>
									<td width="50%" class="descr">
										(должность, фамилия, имя, отчетство (при наличии) руководителя / уполномоченного лица)
									</td>
									<td/>
									<td width="25%" class="descr">(подпись)</td>
								</tr>
								<tr>
									<td colspan="3">
										<br/>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td style="border-bottom: 1px solid black;" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="CustRep:Applicant/CustRep:SigningDetails/RUScat_ru:SigningDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td class="descr">
										(дата составления заявления)
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="CustRep:RegistryAlteration">
					<div class="page">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>Заявление<br/>о внесении изменений в реестр таможенных представителей</b>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/cat_ru:OrganizationName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="CustRep:Applicant/CustRep:LegalEntity/RUScat_ru:BusinessEntityTypeName"/>
							</xsl:with-param>
							<xsl:with-param name="data_align" select="'center'"/>
							<xsl:with-param name="description" select="'(полное фирменное наименование юридического лица с указанием организационно-правовой формы)'"/>
							<xsl:with-param name="width" select="'100%'"/>
						</xsl:call-template>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										просит внести изменения в реестр таможенных представителей в связи с изменением сведений
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:apply-templates select="CustRep:RegistryAlteration/CustRep:Base"/>
							</xsl:with-param>
							<xsl:with-param name="data_align" select="'center'"/>
							<xsl:with-param name="description" select="'(сведения, подлежащие изменению)'"/>
							<xsl:with-param name="width" select="'100%'"/>
						</xsl:call-template>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										<b>Сведения о юридическом лице</b>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>I. Общие сведения о заявителе</b>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" width="5%" align="center">1</td>
									<td class="bordered" colspan="2" width="40%">Организационно-правовая форма</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/RUScat_ru:BusinessEntityTypeName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">2</td>
									<td class="bordered" colspan="2">Полное наименование</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/cat_ru:OrganizationName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">3</td>
									<td class="bordered" colspan="2">Сокращенное наименование</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/cat_ru:ShortName"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">4</td>
									<td class="bordered" colspan="2">Идентификационный номер налогоплательщика (ИНН)</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">5</td>
									<td class="bordered" colspan="2">Код причины постановки на налоговый учет (КПП)</td>
									<td class="bordered">
										<xsl:value-of select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">6</td>
									<td class="bordered" colspan="2">Местонахождение</td>
									<td class="bordered">
										<xsl:apply-templates mode="address" select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/CustRep:FullContactInfo/CustRep:Address"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">7</td>
									<td class="bordered" colspan="2">Почтовый адрес</td>
									<td class="bordered">
										<xsl:apply-templates mode="address" select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/CustRep:FullContactInfo/CustRep:PostalAddress"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">8</td>
									<td class="bordered" colspan="2">Средства связи (телефон, факс, адрес электронной почты)</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/CustRep:FullContactInfo/CustRep:CommunicationDetails">
											<xsl:apply-templates mode="details" select="."/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">9</td>
									<td class="bordered" colspan="2">Наименование и местонахождение обособленных структурных подразделений, через которые заявитель планирует осуществлять деятельность в качестве таможенного представителя</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/CustRep:Filials/CustRep:Filial">
											<xsl:value-of select="cat_ru:OrganizationName"/>
											<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
												<xsl:value-of select="cat_ru:ShortName"/>
											</xsl:if>
											<xsl:if test="CustRep:FilialLocation">
												<xsl:text>, адрес: </xsl:text>
												<xsl:apply-templates mode="address" select="CustRep:FilialLocation"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">10</td>
									<td class="bordered" colspan="2">Код причины постановки на налоговый учет (КПП) обособленных структурных подразделений, через которые заявитель планирует осуществлять деятельность в качестве таможенного представителя</td>
									<td class="bordered">
										<xsl:for-each select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:ApplicantInfo/CustRep:LegalEntity/CustRep:Filials/CustRep:Filial">
											<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="4" align="center">
										<b>II. Сведения об ограничениях сферы деятельности в качестве таможенного представителя</b>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">1</td>
									<td class="bordered" colspan="2">
										Совершение таможенных операций в отношении отдельных категоний товаров
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:LimitsData/CustRep:KindLimitData=1">
											&#10004;<br/>
											<xsl:apply-templates mode="limitData" select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:LimitsData/CustRep:LimitData"/>
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">2</td>
									<td class="bordered" colspan="2">
										Совершение таможенных операций в отношении товаров, не облагаемых вывозными таможенными пошлинами и помещаемых под таможенную процедуру экспорта
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:LimitsData/CustRep:KindLimitData=2">
											&#10004;
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">3</td>
									<td class="bordered" colspan="2">
										Совершение таможенных операций в отдельном регионе деятельности таможенного органа
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:LimitsData/CustRep:KindLimitData=3">
											&#10004;<br/>
											<xsl:apply-templates mode="limitData" select="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:LimitsData/CustRep:LimitData"/>
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" align="center">4</td>
									<td class="bordered" colspan="2">
										Осуществление деятельности без ограничений
									</td>
									<td class="bordered">
										<xsl:if test="CustRep:RegistryAlteration/CustRep:ChangeInfo/CustRep:LimitsData/CustRep:KindLimitData=4">
											&#10004;
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr>
									<td width="50%" style="border-bottom: 1px solid black;">
										<xsl:apply-templates mode="person" select="CustRep:Applicant/CustRep:SigningDetails"/>
									</td>
									<td/>
									<td width="25%" style="border-bottom: 1px solid black;"/>
								</tr>
								<tr>
									<td width="50%" style="border-bottom: 1px solid black;" class="descr">
										(должность, фамилия, имя, отчетство (при наличии) руководителя / уполномоченного лица)
									</td>
									<td/>
									<td width="25%" class="descr">(подпись)</td>
								</tr>
								<tr>
									<td colspan="3">
										<br/>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td style="border-bottom: 1px solid black;" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="CustRep:Applicant/CustRep:SigningDetails/RUScat_ru:SigningDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td/>
									<td/>
									<td class="descr">
										(дата составления заявления)
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<!--xsl:text> </xsl:text-->
		<br/>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<xsl:template mode="limitData" match="*">
		<xsl:if test="CustRep:LimitsRegionList">
			<xsl:text>Код региона: </xsl:text>
			<xsl:for-each select="CustRep:LimitsRegionList">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="CustRep:LimitsRegionText">
			<br/>
			<xsl:text>Регион: </xsl:text>
			<xsl:apply-templates select="CustRep:LimitsRegionText"/>
		</xsl:if>
		<xsl:if test="CustRep:LimitsCategoryText">
			<br/>
			<xsl:text>Категория товаров: </xsl:text>
			<xsl:apply-templates select="CustRep:LimitsCategoryText"/>
		</xsl:if>
		<xsl:if test="CustRep:LimitsTransportList">
			<br/>
			<xsl:text>Код вида трнспорта: </xsl:text>
			<xsl:for-each select="CustRep:LimitsTransportList">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="CustRep:LimitsTransportText">
			<br/>
			<xsl:text>Транспорт: </xsl:text>
			<xsl:apply-templates select="CustRep:LimitsTransportText"/>
		</xsl:if>
		<xsl:if test="CustRep:LimitsCustomText">
			<br/>
			<xsl:text>Таможенные операции: </xsl:text>
			<xsl:apply-templates select="CustRep:LimitsCustomText"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
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
	</xsl:template>
	<xsl:template mode="gtd_num" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:if test="CustRep:DocNumberPrefix">
			<xsl:value-of select="CustRep:DocNumberPrefix"/>
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template mode="docanddate" match="*">
		<xsl:value-of select="CustRep:DocNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="CustRep:DocDate"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month">
					<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
