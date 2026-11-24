<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России № 489 от 25 марта 2019 года "Об утверждении порядка разработки, опубликования и внесения изменений в форматы и структуры электронных документов, участвующих в обмене при взаимодействии таможенных органов Российской Федерации и заинтересованных лиц" -->
<!-- Проект Приказа ФТС России «Об утверждении формы и порядка направления требования о представлении самоходной машины или прицепа для целей осмотра и (или) идентификационной сверки» -->
<!-- Проект Приказа ФТС России «Об утверждении формы и порядка направления требования о представлении колесного транспортного средства (шасси) или прицепа к нему в зону таможенного контроля для целей осмотра и (или) идентификационной сверки» -->
<xsl:stylesheet exclude-result-prefixes="vpd  cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:vpd="urn:customs.ru:Information:CustomsDocuments:VehiclePresentDemand:5.26.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<!-- Шаблон для типа VehiclePresentDemand -->
	<xsl:template match="vpd:VehiclePresentDemand">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Требование о представлении транспортного средства для целей осмотра и (или) идентификационной сверки</title>
				<style type="text/css">
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 190mm;
					max-width: 190mm;
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
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
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

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					.delim
					{height: 7pt;}

					.delim_3
					{height: 3pt;}

					.indent
					{text-indent: 1.5em;}
				</style>
			</head>
			<body>
				<div class="page">
					<!-- Шапка -->
					<table style="width:150mm">
						<tbody>
							<tr>
								<td style="width:55mm" valign="top">
									<table style="width:55mm">
										<tbody>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:CustomsDetails/cat_ru:Code"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">(код и наименование</td>
											</tr>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:CustomsDetails/cat_ru:OfficeName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">таможенного органа)</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="width:40mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								</td>
								<td style="width:70mm" valign="top">
									<table style="width:70mm">
										<tbody>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:PayerInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">(идентификационный номер налогоплательщика, наименование юридического лица,</td>
											</tr>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:PayerInfo/cat_ru:OrganizationName"/>
													<xsl:if test="vpd:PayerInfo/cat_ru:ShortName">
														<xsl:text> </xsl:text>
														(<xsl:value-of select="vpd:PayerInfo/cat_ru:ShortName"/>)
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<xsl:choose>
								<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='0' or vpd:VehicleInfo/vpd:VehicleKind='1'">
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Требование о представлении самоходной машины</xsl:text><br/><xsl:text>или прицепа к ней для целей осмотра</xsl:text><br/><xsl:text>и (или) идентификационной сверки</xsl:text></b>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='2' or vpd:VehicleInfo/vpd:VehicleKind='3'">
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Требование о представлении</xsl:text><br/><xsl:text>колесного транспортного средства (шасси)</xsl:text><br/><xsl:text>или прицепа к нему в зону таможенного контроля</xsl:text><br/><xsl:text>для целей осмотра и (или) идентификационной сверки</xsl:text></b>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr align="center" valign="top">
								<td>
									<xsl:text>от </xsl:text>
									<u>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vpd:DemandFormDate"/>
										</xsl:call-template>
									</u>
									<xsl:if test="vpd:RegNumber">
										<xsl:text> № </xsl:text>
										<u>
											<xsl:value-of select="vpd:RegNumber/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="substring(vpd:RegNumber/cat_ru:RegistrationDate,9,2)"/>
											<xsl:value-of select="substring(vpd:RegNumber/cat_ru:RegistrationDate,6,2)"/>
											<xsl:value-of select="substring(vpd:RegNumber/cat_ru:RegistrationDate,3,2)"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="vpd:RegNumber/cat_ru:SerialNumber"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="vpd:RegNumber/vpd:Add"/>
										</u>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<!-- Основная информация -->
					<div style="text-align: justify">
						<table>
							<tbody>
								<xsl:choose>
									<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='0' or vpd:VehicleInfo/vpd:VehicleKind='1'">
										<tr style="text-align: justify">
											<td>
												<xsl:text>На основании пункта 17 (5) Правил взимания, исчисления, уплаты и взыскания утилизационного сбора в отношении самоходных машин и (или) и прицепов к ним, а также возврата и зачета излишне уплаченных или излишне взысканных сумм этого сбора утвержденных постановлением Правительства Российской Федерации от 6 февраля 2016 г. № 81 «Об утилизационном сборе в отношении самоходных машин и (или) прицепов к ним и о внесении изменений в некоторые акты Правительства Российской Федерации» (далее - Правила),	Вам необходимо разместить</xsl:text>
											</td>
										</tr>
									</xsl:when>
									<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='2' or vpd:VehicleInfo/vpd:VehicleKind='3'">
										<tr style="text-align: justify">
											<td>
												<xsl:text>На основании пункта 12 Правил взимания, исчисления, уплаты и взыскания утилизационного сбора в отношении колесных транспортных средств (шасси) и прицепов к ним, а также возврата и зачета излишне уплаченных или излишне взысканных сумм этого сбора, утвержденных постановлением Правительства Российской Федерации от 26 декабря 2013 г. № 1291 «Об утилизационном сборе в отношении колесных транспортных средств (шасси) и прицепов к ним и о внесении изменений в некоторые акты Правительства Российской Федерации», Вам необходимо разместить</xsl:text>
											</td>
										</tr>
									</xsl:when>
								</xsl:choose>
								<tr align="justify">
									<td>
										<xsl:choose>
											<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='0' or vpd:VehicleInfo/vpd:VehicleKind='1'">
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:choose>
															<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='0'">
																<xsl:text>самоходную машину</xsl:text>
															</xsl:when>
															<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='1'">
																<xsl:text>прицеп к самоходной машине</xsl:text>
															</xsl:when>
														</xsl:choose>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(самоходную машину/прицеп)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='2' or vpd:VehicleInfo/vpd:VehicleKind='3'">
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:choose>
															<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='2'">
																<xsl:text>колесное ТС (шасси)</xsl:text>
															</xsl:when>
															<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='3'">
																<xsl:text>прицеп к колесному ТС</xsl:text>
															</xsl:when>
														</xsl:choose>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(колесное транспортное средство (шасси) или прицеп к нему)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>производитель: </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:VehicleInfo/vpd:Manufacturer"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'127mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>марка, модель: </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:VehicleInfo/vpd:Model"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'128mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>идентификационный номер (заводской номер): </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:VehicleInfo/vpd:VINID"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'67mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="vpd:VehicleInfo/vpd:VehicleKind='2' or vpd:VehicleInfo/vpd:VehicleKind='3'">
									<tr align="justify">
										<td>
											<xsl:text>дата выпуска (производства): </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="vpd:VehicleInfo/vpd:ProductionDate"/>
													</xsl:call-template>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100mm'"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<tr align="justify">
									<td>
										<xsl:text>в зоне таможенного контроля, расположенной по адресу: </xsl:text>
										<xsl:if test="vpd:VehicleInfo/vpd:VehicleKind='0' or vpd:VehicleInfo/vpd:VehicleKind='1'">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:if test="vpd:ZTKCustoms/cat_ru:OfficeName">
														<xsl:value-of select="vpd:ZTKCustoms/cat_ru:OfficeName"/>
														<xsl:text> (</xsl:text>
													</xsl:if>
													<xsl:value-of select="vpd:ZTKCustoms/cat_ru:Code"/>
													<xsl:if test="vpd:ZTKCustoms/cat_ru:OfficeName">
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование таможенного поста)'"/>
												<xsl:with-param name="width" select="'48mm'"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="vpd:ZTKAddress"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(место нахождения и адрес, в пределах места нахождения зоны таможенного контроля)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>в срок до </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="vpd:VehiclePresentationTerm"/>
												</xsl:call-template>
												<xsl:if test="vpd:VehiclePresentationTerm">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="substring(vpd:VehiclePresentationTerm, 12, 5)"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="dot" select="1"/>
											<xsl:with-param name="description" select="'(время, дата)'"/>
											<xsl:with-param name="width" select="'60mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="vpd:VehicleInfo/vpd:VehicleKind='0' or vpd:VehicleInfo/vpd:VehicleKind='1'">
									<tr>
										<td><br/></td>
									</tr>
									<tr style="text-align: justify">
										<td>
											<xsl:text>О невозможности представления самоходной машины или прицепа к ней в зону таможенного контроля в соответствии с абзацем вторым пункта 17 (5) Правил необходимо сообщить (с мотивированным обоснованием и указанием адреса фактического местонахождения самоходной машины или прицепа к ней) по адресу:</xsl:text>
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="vpd:FactAddress"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
											<br/>
											<xsl:text>и адресу электронной почты: </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="vpd:FactAddress/vpd:E_mail"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="dot" select="1"/>
												<xsl:with-param name="width" select="'102mm'"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<br/>
					<br/>
					<!-- Подписи -->
					<div>
						<table style="page-break-inside: avoid;">
							<tbody>
								<tr>
									<td width="40%" class="value" align="center">
										<xsl:apply-templates select="vpd:CustomsPerson" mode="fio"/>
									</td>
									<td width="5%"/>
									<td width="20%" class="value" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vpd:DemandDirectionDate"/>
										</xsl:call-template>
									</td>
									<td width="5%"/>
									<td width="30%" class="value" align="center">
										<xsl:value-of select="vpd:CustomsPerson/RUScat_ru:LNP"/>
									</td>
								</tr>
								<tr>
									<td width="40%" class="descr" align="center">
										<xsl:text>(фамилия, имя, отчество (при наличии) начальника таможенного органа (лица, его замещающего))</xsl:text>
									</td>
									<td width="5%"/>
									<td width="20%" class="descr" align="center">
										<xsl:text>(дата направления настоящего требования)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="30%" class="descr" align="center">
										<xsl:text>(подпись, личная номерная печать печать (при наличии))</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="vpd:ZTKAddress | vpd:FactAddress">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
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
	<xsl:template match="//*[local-name()='VehiclePresentDemand']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
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
</xsl:stylesheet>