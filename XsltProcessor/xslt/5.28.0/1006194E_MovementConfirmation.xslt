<?xml version="1.0" encoding="utf-8"?>
<!--Приказ Минфина России № 71н от 29 мая 2024 года "Об утверждении Порядка и технологии совершения таможенных операций в отношении товаров (в том числе транспортных средств), ввозимых на участки территорий опережающего развития, Арктической зоны Российской Федерации, ввозимых или ввезенных на участки территории свободного порта Владивосток, на которых применяется таможенная процедура свободной таможенной зоны, в том числе связанных с осуществлением идентификации товаров, ввозимых (ввезенных) на такие участки, и вывозимых с таких участков"
И НЕ ТОЛЬКО этот приказ-->
<!--Приказ Минфина России от 13.05.2016 г. № 61н "Об утверждении Порядка совершения таможенных операций при проведении идентификации товаров Евразийского экономического союза, ввозимых на территорию особой экономической зоны с остальной части таможенной территории Евразийского экономического союза, и совершения таможенных операций при обратном вывозе таких товаров с территории особой экономической зоны на остальную часть таможенной территории Евразийского экономического союза"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:mvcf="urn:customs.ru:Information:CustomsDocuments:MovementConfirmation:5.26.0">
	<!-- Шаблон для типа MovementConfirmationType -->
	<xsl:template match="mvcf:MovementConfirmation">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Уведомление </xsl:text>
											<xsl:choose>
												<xsl:when test="mvcf:DocSign='0'">
													<xsl:text>о ввозе</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='1'">
													<xsl:text>об убытии товаров</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='2'">
													<xsl:text>уведомление о завершении действия пропуска</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='3'">
													<xsl:text>о ввозе на территорию ОЭЗ (Приказ 61н)</xsl:text>
												</xsl:when>
												<!--xsl:when test="mvcf:DocSign='3'">
													<xsl:text>уведомление о прибытии МПО в ММПО</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='4'">
													<xsl:text>о прибытии в   автоматизированный КПП</xsl:text>
												</xsl:when>
												<xsl:when test="mvcf:DocSign='5'">
													<xsl:text>об убытии из автоматизированного КПП</xsl:text>
												</xsl:when-->
												<xsl:otherwise>
													<xsl:value-of select="mvcf:DocSign"/>
												</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="mvcf:Customs">
						<div class="title marg-top">Код и наименование таможенного органа</div>
						<div>
							<xsl:apply-templates select="mvcf:Customs">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:Applicant">
						<div class="title marg-top">Сведения о заинтересованном лице</div>
						<div>
							<xsl:apply-templates select="mvcf:Applicant">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата фактического ввоза/вывоза товаров (дата завершения действия пропуска)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mvcf:MovementDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mvcf:MovementTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Время фактического ввоза/ вывоза товаров</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="mvcf:MovementTime">
										<xsl:variable name="xpath_date">
											<xsl:call-template name="get_xpath">
												<xsl:with-param name="node" select="."/>
											</xsl:call-template>
										</xsl:variable>
										<element xml_node="{$xpath_date}">
											<xsl:value-of select="substring(., 1, 8)"/>
										</element>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:ImportPlace">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Место ввоза товаров</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="mvcf:ImportPlace='1'">
											<xsl:text>Аэропорт Калининград (Храброво)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='2'">
											<xsl:text>Морской порт Калининград, участок в г. Балтийск</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='3'">
											<xsl:text>Морской порт Калининград, участок в г. Светлый</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='4'">
											<xsl:text>Морской порт Калининград, участок в г. Калининград</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='5'">
											<xsl:text>Морской терминал в г. Пионерский</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='6'">
											<xsl:text>85 км федеральной автомобильной дороги Магадан - Якутск («Колыма»)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='7'">
											<xsl:text>Морской порт Магадан</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='8'">
											<xsl:text>Аэропорт Магадан (Сокол)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='9'">
											<xsl:text>Комплекс зданий, сооружений и посадочная площадка для самолетов и вертолетов, предназначенные для организации воздушного движения (Магаданская область, г. Магадан, 13 км основной трассы)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='10'">
											<xsl:text>Аэропорт Южно-Курильск (Менделеево)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='11'">
											<xsl:text>Аэропорт Ясный (остров Итуруп)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='12'">
											<xsl:text>Морской терминал Южно-Курильск (остров Кунашир)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='13'">
											<xsl:text>Морской терминал Малокурильск (остров Шикотан)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='14'">
											<xsl:text>Морской терминал Крабозаводск (остров Шикотан)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='15'">
											<xsl:text>Морской терминал Курильск, бухта Ольга (остров Итуруп)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='16'">
											<xsl:text>Морской терминал Курильск, бухта Китовая (остров Итуруп)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='17'">
											<xsl:text>Морской терминал Северо-Курильск (остров Парамушир)</xsl:text>
										</xsl:when>
										<xsl:when test="mvcf:ImportPlace='99'">
											<xsl:text>Иное место ввоза</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="mvcf:ImportPlace"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:ImportPlaceName">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование места ввоза товаров</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:ImportPlaceName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:RegistrationNumber">
						<div class="title marg-top">Регистрационный номер уведомления о ввозе/вывозе/ Заявления о проведении идентификации</div>
						<div>
							<xsl:apply-templates select="mvcf:RegistrationNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:DocumentNumber">
						<div class="title marg-top">Номер транспортного (перевозочного) или коммерческого документа (при ввозе)</div>
						<div>
							<xsl:apply-templates select="mvcf:DocumentNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:ImExRegistrationNumber">
						<div class="title marg-top">Регистрационный номер разрешения на ввоз/вывоз</div>
						<div>
							<xsl:apply-templates select="mvcf:ImExRegistrationNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mvcf:MPO_Number">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:MPO_Number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:PTDNum">
						<div class="title marg-top">Номер предварительной таможенной декларации</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код таможенного органа, зарегистрировавшего документ</td>
									<td class="graphMain bordered">Дата регистрации документа</td>
									<td class="graphMain bordered">Порядковый номер документа по журналу регистрации</td>
								</tr>
								<xsl:for-each select="mvcf:PTDNum">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:TransportWeight">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Вес транспортного средства по результатам взвешивания на КПП, кг</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:TransportWeight" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:TransportIdentifier">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер транспортного средства</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:TransportIdentifier"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:Comments">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Примечание</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mvcf:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mvcf:PersonSignature">
						<div class="title marg-top">Подпись уполномоченного представителя Заявителя </div>
						<div>
							<xsl:apply-templates select="mvcf:PersonSignature">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="mvcf:Applicant">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<!--xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if-->
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<!--xsl:if test="RUScat_ru:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryA2Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
				<div class="title marg-top">Кодовое обозначение организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы, в которой зарегистрирован хозяйствующий субъект</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:UITN">
				<div class="title marg-top">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:UITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:PersonId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:PersonId"/>
						</td>
					</tr>
				</table>
			</xsl:if-->
			<xsl:if test="mvcf:Address">
				<div class="title marg-top">Адрес</div>
				<xsl:for-each select="mvcf:Address">
					<xsl:apply-templates select=".">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="mvcf:IdentityCard">
				<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
				<div>
					<xsl:apply-templates select="mvcf:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="mvcf:CertificateNumber">
				<div class="title marg-top">Номер свидетельства, удостоверяющего регистрацию лица в качестве резидента особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации), или свидетельства о включении в единый реестр участников свободной экономической зоны)</div>
				<div>
					<xsl:apply-templates select="mvcf:CertificateNumber">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<!--xsl:if test="RUScat_ru:CommunicationDetails">
				<div class="title marg-top">Контактный реквизит субъекта</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:CommunicationDetails">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if-->
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="mvcf:CertificateNumber">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:value-of select="."/>
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
							<xsl:value-of select="cat_ru:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:Telex"/>
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
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template -->
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="mvcf:IdentityCard">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IssuerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:IssuerCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:FullIdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование вида документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AuthorityId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:AuthorityId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="mvcf:Address">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:AddressKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вид адреса</td>
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
									<xsl:value-of select="RUScat_ru:AddressKindCode" />
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
							<xsl:apply-templates select="RUScat_ru:PostalCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:District" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Town" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:City" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
						<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:StreetHouse" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:House" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Room" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AddressText">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKATO" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:KLADR" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOGUID" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOID" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:TerritoryCode" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="RUScat_ru:UITNCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template -->
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN=ИНН">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN=ПИН">
									<xsl:text>персональный идентификационный номер</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="cat_ru:KGINN"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="mvcf:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="mvcf:DocumentNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mvcf:ImExRegistrationNumberType -->
	<xsl:template match="mvcf:ImExRegistrationNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:Number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="mvcf:AddNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">4-ая часть номера</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:AddNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="mvcf:PTDNum">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="mvcf:PersonSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonSurname">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Фамилия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonSurname"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Имя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mvcf:RegistrationNumberType -->
	<xsl:template match="mvcf:RegistrationNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="mvcf:AddNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Первая часть регистрационного номера документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:AddNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mvcf:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mvcf:Number"/>
					</td>
				</tr>
			</table>
			<xsl:if test="mvcf:DocKind">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Четвертая часть регистрационного номера документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mvcf:DocKind"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template match="//*[local-name()='MovementConfirmation']//*" priority="-1">
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
