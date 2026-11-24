<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:ecd_or="urn:customs.ru:Information:CustomsDocuments:ECD_AppOperatorsRegister:5.28.0">
	<!-- Шаблон для типа ECD_AppOperatorsRegisterType -->
	<xsl:template match="ecd_or:ECD_AppOperatorsRegister">
		<xsl:param name="w" select="190"/>
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:choose>
						<xsl:when test="ecd_or:DocKind = 1">
							<xsl:call-template name="toWhom"/>
							<br/>
							<br/>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>Заявление о включении<br/>в реестр операторов электронной торговли</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="inlinetable" style="min-width: 100%; width: 100%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="ecd_or:Applicant/cat_ru:OrganizationName"/>
											<xsl:if test="not(ecd_or:Applicant/cat_ru:OrganizationName)">
												<xsl:apply-templates select="ecd_or:Applicant/cat_ru:ShortName"/>
											</xsl:if>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(полное наименование организации)
										</td>
									</tr>
								</tbody>
							</table>
							<p style="text-indent: 5mm;">
								<xsl:text>Просим рассмотреть представленные документы и включить</xsl:text>
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="center">
											<td class="value">
												<xsl:apply-templates select="ecd_or:Applicant/cat_ru:OrganizationName"/>
												<xsl:if test="not(ecd_or:Applicant/cat_ru:OrganizationName)">
													<xsl:apply-templates select="ecd_or:Applicant/cat_ru:ShortName"/>
												</xsl:if>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(наименование организации)
											</td>
										</tr>
									</tbody>
								</table>
								<xsl:text>в реестр операторов электронной торговли.</xsl:text>
							</p>
							<br/>
							<div style="width: 100%; font-weight: bold; text-align: center;">СВЕДЕНИЯ О ЗАЯВИТЕЛЕ</div>
							<br/>
							<table style="font-size: 10pt;">
								<tbody>
									<tr>
										<td width="5%"></td>
										<td width="50%"></td>
										<td width="45%"></td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">I. Общие сведения о заявителе</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">1</td>
										<td class="bordered">Полное наименование юридического лица</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:Applicant/cat_ru:OrganizationName"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">2</td>
										<td class="bordered">Сокращенное наименование юридического лица (при наличии)</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:Applicant/cat_ru:ShortName"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">3</td>
										<td class="bordered">Организационно-правовая форма юридического лица</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:Applicant/RUScat_ru:BusinessEntityTypeName"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">4</td>
										<td class="bordered">Идентификационный номер налогоплательщика</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">5</td>
										<td class="bordered">Место нахождения юридического лица (юридический адрес), почтовый адрес</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:Applicant/RUScat_ru:SubjectAddressDetails" mode="address"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">6</td>
										<td class="bordered">Средства связи (адрес электронной почты, телефон), сайт в информационно-телекоммуникационной сети "Интернет"</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:Applicant/RUScat_ru:CommunicationDetails" mode="communication"/>
											<xsl:if test="ecd_or:Applicant/ecd_or:InformationSourceName">
												<xsl:text>Наименование сайта: </xsl:text>
												<xsl:apply-templates select="ecd_or:Applicant/ecd_or:InformationSourceName"/>
												<br/>
											</xsl:if>
											<xsl:if test="ecd_or:Applicant/ecd_or:DetailsResourceId">
												<xsl:text>Ссылка на сайт: </xsl:text>
												<xsl:apply-templates select="ecd_or:Applicant/ecd_or:DetailsResourceId"/>
												<br/>
											</xsl:if>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">7</td>
										<td class="bordered">Сведения о физических лицах, являющихся учредителем (участником) юридического лица-заявителя, его руководителем, гравным бухгалтером, включающие фамилию, имя, отчетство (при наличии), страховой номер индивидуального лицевого счета (при наличии), дату рождения, место рождения, адрес места жительства (проживания)</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:Founder"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">8</td>
										<td class="bordered">Идентификатор информацинной системы декларанта или оператора информационных услуг (ParticipantID)</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:ParticipantID"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">II. Сведения о банковских счетах</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">9</td>
										<td class="bordered">Открытые банковские счета, которые будут использоваться для осуществления деятельности в качестве оператора электронной торговли</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:BankAccountInformation"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">III. Сведения о складе электронной торговли</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">10</td>
										<td class="bordered">Предназначение склада электронной торговли (для временного хранения товаров электронной торговли и (или) для хранения товаров электронной торговли, помещенных под таможенную процедуру таможенного склада)</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:WHInformation/ecd_or:WHPurpose" mode="splitCR"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">11</td>
										<td class="bordered">Местонахождение склада электронной торговли</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:WHInformation/ecd_or:WHPurposeAddress" mode="address"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">12</td>
										<td class="bordered">Обустройство, оборудование и материально-техническое оснащение склада электронной торговли</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:WHInformation/ecd_or:WHArrangement"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">13</td>
										<td class="bordered">Полезный объем помещения и (или) полезная площадь склада электронной торговли</td>
										<td class="bordered">
											<xsl:for-each select="ecd_or:RegistryInclusion/ecd_or:WHInformation/*[contains(local-name(), 'WHUs')]">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:choose>
													<xsl:when test="local-name() = 'WHUsefulVolume'">Объем: </xsl:when>
													<xsl:when test="local-name() = 'WHUsableArea'">Площадь: </xsl:when>
												</xsl:choose>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">IV. Сведения об обеспечении исполнения обязанностей юридического лица, осуществляющего дятельность в качестве оператора электронной торговли</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">14</td>
										<td class="bordered">Регистрационный номер и дата документа, подтверждающего принятие обеспечения исполнениня, обязанностей юридического лица, осуществляющего деятельность в качестве оператора электронной торговли</td>
										<td class="bordered">
											<xsl:for-each select="ecd_or:RegistryInclusion/ecd_or:InformationAboutSecuring/ecd_or:Support">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:for-each select="*[contains(local-name(), 'Info')]">
													<xsl:if test="ecd_or:DocNumber">
														<xsl:text> № </xsl:text>
														<xsl:apply-templates select="ecd_or:DocNumber"/>
													</xsl:if>
													<xsl:if test="ecd_or:DocDate">
														<xsl:text> от </xsl:text>
														<xsl:apply-templates select="ecd_or:DocDate" mode="russian_date"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">15</td>
										<td class="bordered">Общая сумма обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в качестве оператора электронной торговли</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:InformationAboutSecuring/ecd_or:SupportSum"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">16</td>
										<td class="bordered">Способ (способы) обеспечения исполнения обязанностей юридического лица, осуществляющего деятельность в качестве оператора электронной торговли</td>
										<td class="bordered">
											<xsl:for-each select="ecd_or:RegistryInclusion/ecd_or:InformationAboutSecuring/ecd_or:Support">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="ecd_or:TypeSupport"/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">V. Сведения о договоре (договорах) страхования риска гражданской ответственности</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">17</td>
										<td class="bordered">Номер, дата и срок действия договора риска гражданской ответственности</td>
										<td class="bordered">
											<xsl:for-each select="ecd_or:RegistryInclusion/ecd_or:RiskInsurance">
												<xsl:if test="ecd_or:NumInsurance">
													<xsl:text>№ </xsl:text>
													<xsl:apply-templates select="ecd_or:NumInsurance"/>
												</xsl:if>
												<xsl:if test="ecd_or:DateInsurance">
													<xsl:text> от </xsl:text>
													<xsl:apply-templates select="ecd_or:DateInsurance" mode="russian_date"/>
												</xsl:if>
												<xsl:if test="ecd_or:DateOnInsurance or ecd_or:DateOffInsurance">
													<xsl:text> срок действия </xsl:text>
													<xsl:if test="ecd_or:DateOnInsurance">
														<xsl:text> c </xsl:text>
														<xsl:apply-templates select="ecd_or:DateOnInsurance" mode="russian_date"/>
													</xsl:if>
													<xsl:if test="ecd_or:DateOffInsurance">
														<xsl:text> по </xsl:text>
														<xsl:apply-templates select="ecd_or:DateOffInsurance" mode="russian_date"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">18</td>
										<td class="bordered">Общая сумма страхования</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:RiskInsurance/ecd_or:PriceInsurance"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" align="center">19</td>
										<td class="bordered">Наименование страховой компании, номер и дата выдачи лицензии на право страхования ответственности</td>
										<td class="bordered">
											<xsl:apply-templates select="ecd_or:RegistryInclusion/ecd_or:RiskInsurance/ecd_or:InsuranceCompanyName"/>
											<xsl:for-each select="ecd_or:RegistryInclusion/ecd_or:RiskInsurance/ecd_or:LiabilityInsurance">
												<xsl:text>, лицензия: </xsl:text>
												<xsl:if test="cat_ru:PrDocumentNumber">
													<xsl:text>№ </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
												</xsl:if>
												<xsl:if test="cat_ru:PrDocumentDate">
													<xsl:text> от </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<p style="text-indent: 5mm;">
								<xsl:text>К заявлению прилагаются следующие документы:</xsl:text>
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="left">
											<td class="value">
												<xsl:apply-templates select="ecd_or:AppliedDocument" mode="splitCR"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(документы, прилагаемые к настоящему заявлению, с указанием количества листов по каждому документу)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<p>
								<xsl:text>Общее количество листов </xsl:text>
								<span style="display:inline-block; width: 20mm; border-bottom: 1px solid black; text-align: center">
									<xsl:apply-templates select="ecd_or:SheetsNumber"/>
								</span>
							</p>
							<br/>
							<br/>
							<xsl:apply-templates select="ecd_or:HeadPerson"/>
						</xsl:when>
						<xsl:when test="ecd_or:DocKind = 2">
							<table>
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>Заявление о внесении изменений<br/>в реестр операторов электронной торговли</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:call-template name="toWhom"/>
							<br/>
							<p style="text-indent: 5mm;">
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="center">
											<td class="value">
												<xsl:apply-templates select="ecd_or:Applicant/cat_ru:OrganizationName"/>
												<xsl:if test="not(ecd_or:Applicant/cat_ru:OrganizationName)">
													<xsl:apply-templates select="ecd_or:Applicant/cat_ru:ShortName"/>
												</xsl:if>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(наименование организации)
											</td>
										</tr>
									</tbody>
								</table>
								<xsl:text>просит рассмотреть возможность внесения изменений в реестр операторов электронной торговли следующих сведений:</xsl:text>
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="left">
											<td class="value">
												<xsl:if test="ecd_or:RegistryAlteration/ecd_or:Base">
													<xsl:text>Суть обращения: </xsl:text>
													<xsl:apply-templates select="ecd_or:RegistryAlteration/ecd_or:Base"/>
													<br/>
													<br/>
												</xsl:if>
												<xsl:apply-templates select="ecd_or:RegistryAlteration/ecd_or:ChangeInfo"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(сведения об операторе электронной торговли, подлежащие изменению)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<br/>
							<p style="text-indent: 5mm;">
								<xsl:text>К заявлению прилагаются следующие документы, подтверждающие заявленные сведения:</xsl:text>
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="left">
											<td class="value">
												<xsl:apply-templates select="ecd_or:AppliedDocument" mode="splitCR"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(документы, прилагаемые к настоящему заявлению, с указанием количества листов по каждому документу)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<p>
								<xsl:text>Общее количество листов </xsl:text>
								<span style="display:inline-block; width: 20mm; text-align: center;" class="value">
									<xsl:apply-templates select="ecd_or:SheetsNumber"/>
								</span>
							</p>
							<br/>
							<br/>
							<xsl:apply-templates select="ecd_or:HeadPerson"/>
						</xsl:when>
						<xsl:when test="ecd_or:DocKind = 3">
							<table>
								<tbody>
									<tr>
										<td align="center">
											<font size="4">
												<b>Заявление об исключении из реестра<br/>операторов электронной торговли</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:call-template name="toWhom"/>
							<br/>
							<p style="text-indent: 5mm;">
								<table class="inlinetable" style="min-width: 100%; width: 100%;">
									<tbody>
										<tr align="center">
											<td class="value">
												<xsl:apply-templates select="ecd_or:Applicant/cat_ru:OrganizationName"/>
												<xsl:if test="not(ecd_or:Applicant/cat_ru:OrganizationName)">
													<xsl:apply-templates select="ecd_or:Applicant/cat_ru:ShortName"/>
												</xsl:if>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(наименование организации - оператора электронной торговли)
											</td>
										</tr>
									</tbody>
								</table>
								<xsl:text>на основании подпункта 3 пункта 1 статьи 429 Таможенного кодекса Евразийского экономического союза прошу исключить из реестра операторов электронной торговли.</xsl:text>
							</p>
							<br/>
							<br/>
							<xsl:apply-templates select="ecd_or:HeadPerson"/>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ecd_or:HeadPerson">
		<table>
			<tbody>
				<tr valign="bottom">
					<td width="30%">Руководитель организации (представитель по доверенности)<br/><xsl:apply-templates select="cat_ru:PersonPost"/></td>
					<td width="20%" class="value"></td>
					<td width="50%" align="center" class="value">
						<xsl:apply-templates select="*[contains(local-name(), 'ame')]" mode="splitSpace"/>
					</td>
				</tr>
				<tr>
					<td class="descr"></td>
					<td class="descr">(подпись)</td>
					<td class="descr">(фамили, имя, отчество (при наличии))</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ecd_or:AppliedDocument">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name() = 'PrDocumentNumber'"> № </xsl:when>
				<xsl:when test="local-name() = 'PrDocumentDate'"> от </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="local-name() = 'PrDocumentDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ecd_or:TypeSupport">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = '01'">Денежный залог</xsl:when>
				<xsl:when test=". = '02'">Банковская гарантия</xsl:when>
				<xsl:when test=". = '03'">Договор поручительства</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="ecd_or:WHPurpose">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">временное хранение товаров электронной торговли</xsl:when>
				<xsl:when test=". = 2">хранение товаров электронной торговли, помещенных под таможенную процедуру таможенного склада</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="ecd_or:BankAccountInformation">
		<xsl:if test="position() != 1"><br/><br/></xsl:if>
		<xsl:text>Банковский счет: </xsl:text>
		<xsl:apply-templates select="cat_ru:BankAccount" mode="splitComma"/>
		<br/>
		<xsl:text>Описание счета: </xsl:text>
		<xsl:apply-templates select="cat_ru:BankAccountDescription"/>
		<br/>
		<xsl:text>Название банка: </xsl:text>
		<xsl:apply-templates select="cat_ru:BankName"/>
		<br/>
		<xsl:if test="cat_ru:BankMFO">
			<xsl:text>МФО </xsl:text><xsl:apply-templates select="cat_ru:BankMFO"/><xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<xsl:text>ОКПО </xsl:text><xsl:apply-templates select="cat_ru:OKPOID"/><xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text>БИК </xsl:text><xsl:apply-templates select="cat_ru:BICID"/><xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text>SWIFT </xsl:text><xsl:apply-templates select="cat_ru:SWIFTID"/><xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text>Корр.счет </xsl:text><xsl:apply-templates select="cat_ru:CorrAccount"/><xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<xsl:text>Вал.счет: </xsl:text><xsl:apply-templates select="cat_ru:TransitCurrencyAccount" mode="splitComma"/><xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<xsl:text>Спец.вал.счет: </xsl:text><xsl:apply-templates select="cat_ru:SpecialTransitCurrencyAccount" mode="splitComma"/><xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ecd_or:Founder">
		<xsl:if test="position() != 1"><br/><br/></xsl:if>
		<xsl:apply-templates select="ecd_or:PersonFIO/*[contains(local-name(), 'ame')]" mode="splitSpace"/>
		<xsl:if test="ecd_or:PersonFIO/cat_ru:PersonPost">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="ecd_or:PersonFIO/cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="ecd_or:INN">
			<xsl:text>, СНИЛС: </xsl:text>
			<xsl:apply-templates select="ecd_or:INN"/>
		</xsl:if>
		<xsl:text>, дата рождения: </xsl:text>
		<xsl:apply-templates select="ecd_or:BirthDate" mode="russian_date"/>
		<xsl:text>, место рождения: </xsl:text>
		<xsl:apply-templates select="ecd_or:BirthPlace"/>
		<xsl:text>, адрес: </xsl:text>
		<xsl:apply-templates select="ecd_or:Address" mode="address"/>
	</xsl:template>
	<xsl:template match="*" mode="communication">
		<xsl:if test="*[local-name() = 'Phone']">
			<xsl:text>тел.: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'Phone']" mode="splitComma"/>
			<br/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'Fax']">
			<xsl:text>факс: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'Fax']"/>
			<br/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'Telex']">
			<xsl:text>телекс: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'Telex']"/>
			<br/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'E_mail']">
			<xsl:text>e-mail: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'E_mail']" mode="splitComma"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="splitComma">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitSpace">
		<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitCR">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() != 'AddressText']" mode="splitComma"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[local-name() = 'AddressKindCode']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">Адрес регистрации</xsl:when>
				<xsl:when test=". = 2">Фактический адрес</xsl:when>
				<xsl:when test=". = 3">Почтовый адрес</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template name="toWhom">
		<table>
			<tbody>
				<tr>
					<td width="60%"/>
					<td width="40%" align="center">
						<xsl:text>Руководителю ФТС России</xsl:text>
						<br/>
						<table class="inlinetable" style="min-width: 100%; width: 100%;">
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:for-each select="ecd_or:CustomsPerson/*[contains(local-name(), 'ame')]">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">
										(фамилия, имя, отчетство (при наличии))
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:call-template name="month_date">
							<xsl:with-param name="date" select="ecd_or:AppDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="month_date">
		<xsl:param name="date"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$date"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="month" select="substring($date, 6,2)"/>
			<xsl:text>"</xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 9, 2)"/>
			</span>
			<xsl:text>" </xsl:text>
			<span style="display: inline-block; width: 25mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:choose>
					<xsl:when test="$month = '01'">января</xsl:when>
					<xsl:when test="$month = '02'">февраля</xsl:when>
					<xsl:when test="$month = '03'">марта</xsl:when>
					<xsl:when test="$month = '04'">апреля</xsl:when>
					<xsl:when test="$month = '05'">мая</xsl:when>
					<xsl:when test="$month = '06'">июня</xsl:when>
					<xsl:when test="$month = '07'">июля</xsl:when>
					<xsl:when test="$month = '08'">августа</xsl:when>
					<xsl:when test="$month = '09'">сентября</xsl:when>
					<xsl:when test="$month = '10'">октября</xsl:when>
					<xsl:when test="$month = '11'">ноября</xsl:when>
					<xsl:when test="$month = '12'">декабря</xsl:when>
				</xsl:choose>
			</span>
			<xsl:text> 20</xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 3, 2)"/>
			</span>
			<xsl:text>г.</xsl:text>
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
	<xsl:template match="//*[local-name()='ECD_AppOperatorsRegister']//*" priority="-1">
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
