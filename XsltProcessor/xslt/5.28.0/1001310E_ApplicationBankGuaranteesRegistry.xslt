<?xml version="1.0" encoding="utf-8"?>
<!-- Пункт 8.5 Детального плана реализации внедрения принципов клиентоцентричности в рамках государственной услуги "Ведение реестра банков, обладающих правом выдачи банковских гарантий"  
Приказ Минфина России от 14.01.2020 № 6н «Об утверждении формы реестра банков, обладающих правом выдачи банковских гарантий, формы заявления о включении в реестр банков, обладающих правом выдачи банковских гарантий, Порядка ведения реестра банков, обладающих правом выдачи банковских гарантий, а также Порядка контроля за соблюдением банками, включенными в реестр банков, обладающих правом выдачи банковских гарантий, условий включения в данный реестр и обязанностей, установленных для таких банков».
Приложение 2 - (ApplicationType = ВК) - Заявление о включении в реестр банков, обладающих правом выдачи банковских гарантий
Приложение 3 - (ApplicationType = ИЗ) - Заявление о внесении изменений в реестр банков, обладающих правом выдачи банковских гарантий
Приложение 4 - (ApplicationType = ИС) - Заявление об исключении таможенного перевозчика из реестра банков, обладающих правом выдачи банковских гарантий -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RegBG="urn:customs.ru:Information:RegistrationDocuments:ApplicationBankGuaranteesRegistry:5.24.0">
	<!-- Шаблон для типа ApplicationBankGuaranteesRegistryType -->
	<xsl:template match="RegBG:ApplicationBankGuaranteesRegistry">
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
					{font-size: 8pt;
					text-align: center;
					vertical-align:top;}

					.indent
					{text-indent: 1.5em;}

					.delim_3
					{height: 3pt;}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w180">
						<tbody>
							<tr>
								<td align="right" class="graphMain">
									<xsl:text>В Федеральную таможенную службу</xsl:text>
									<br/>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="RegBG:ApplicationType = 'ВК'">
											<b>Заявление о включении в реестр банков, обладающих правом выдачи банковских гарантий</b>
										</xsl:when>
										<xsl:when test="RegBG:ApplicationType = 'ИЗ'">
											<b>Заявление о внесении изменений в реестр банков, обладающих правом выдачи банковских гарантий</b>
										</xsl:when>
										<xsl:when test="RegBG:ApplicationType = 'ИС'">
											<b>Заявление об исключении из реестра банков, обладающих правом выдачи банковских гарантий</b>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="RegBG:AppOrganizationInfo/RUScat_ru:OrganizationName"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(полное наименование банка)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:choose>
										<xsl:when test="RegBG:ApplicationType = 'ВК'">
											<xsl:text>просит Федеральную таможенную службу включить банк в реестр банков, обладающих правом выдачи банковских гарантий, и подтверждает, что банком соблюдены требования, установленные частью 3 статьи 64 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" (Собрание законодательства Российской Федерации, 2018, № 32, ст. 5082).</xsl:text>
										</xsl:when>
										<xsl:when test="RegBG:ApplicationType = 'ИЗ'">
											<xsl:text>на основании части 11 статьи 64 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" просит Федеральную таможенную службу внести в реестр банков, обладающих правом выдачи банковских гарантий, следующие изменения в сведения о банке:</xsl:text>
										</xsl:when>
										<xsl:when test="RegBG:ApplicationType = 'ИС'">
											<xsl:text>на основании части 14 статьи 64 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" просит Федеральную таможенную службу исключить банк из реестра банков, обладающих правом выдачи банковских гарантий.</xsl:text>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="RegBG:ApplicationType = 'ИЗ'">
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
													<td align="center" class="bordered" width="10%">
														<xsl:text>№ п/п</xsl:text>
													</td>
													<td align="center" class="bordered" width="40%">
														<xsl:text>Краткое наименование банка</xsl:text>
													</td>
													<td align="center" class="bordered" width="25%">
														<xsl:text>ИНН</xsl:text>
													</td>
													<td align="center" class="bordered" width="25%">
														<xsl:text>ОКПО</xsl:text>
													</td>
												</tr>
												<tr>
													<td align="center" class="bordered" width="10%">
														<xsl:text>1</xsl:text>
													</td>
													<td align="center" class="bordered" width="40%">
														<xsl:text>2</xsl:text>
													</td>
													<td align="center" class="bordered" width="25%">
														<xsl:text>3</xsl:text>
													</td>
													<td align="center" class="bordered" width="25%">
														<xsl:text>4</xsl:text>
													</td>
												</tr>
												<xsl:for-each select="RegBG:ChangeInformation">
													<tr>
														<td align="center" class="bordered" width="10%">
															<xsl:value-of select="position()"/>
														</td>
														<td align="center" class="bordered" width="40%">
															<xsl:value-of select="RegBG:ShortBankName"/>
														</td>
														<td align="center" class="bordered" width="25%">
															<xsl:value-of select="RegBG:INN"/>
														</td>
														<td align="center" class="bordered" width="25%">
															<xsl:value-of select="RegBG:OKPOID"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="RegBG:ChangeDetails">
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="RegBG:ChangeDetails"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="descr">
												<xsl:text>(примечание)</xsl:text>
											</xsl:with-param>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
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
												<td align="left" class="graphMain" colspan="5">
													<xsl:text>Информация о банке:</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>лицензия на осуществление банковских операций</xsl:text>
												</td>
												<td width="5%"/>
												<td align="center" class="value" width="20%">
													<xsl:value-of select="RegBG:LiCDetails/RegBG:RegNumber"/>
												</td>
												<td width="5%"/>
												<td align="center" class="value" width="20%">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="RegBG:LiCDetails/RegBG:Date"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="2" width="55%"/>
												<td align="center" class="descr" width="20%">
													<xsl:text>(регистрационный номер)</xsl:text>
												</td>
												<td width="5%"/>
												<td align="center" class="descr" width="20%">
													<xsl:text>(дата выдачи)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>идентификационный номер налогоплательщика / код причины постановки на учет</xsl:text>
												</td>
												<td width="5%"/>
												<td align="center" class="value" width="20%">
													<xsl:value-of select="RegBG:AppOrganizationInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</td>
												<td  align="center" width="5%" valign="bottom">
													<xsl:text>/</xsl:text>
												</td>
												<td align="center" class="value" width="20%">
													<xsl:value-of select="RegBG:AppOrganizationInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>код по Общероссийскому классификатору предприятий и организаций</xsl:text>
												</td>
												<td width="5%"/>
												<td colspan="3" align="center" class="value" width="45%">
													<xsl:value-of select="RegBG:AppOrganizationInfo/RegBG:OKPO"/>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>основной государственный регистрационный номер</xsl:text>
												</td>
												<td width="5%"/>
												<td colspan="3" align="center" class="value" width="45%">
													<xsl:value-of select="RegBG:AppOrganizationInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>адрес юридического лица</xsl:text>
												</td>
												<td width="5%"/>
												<td colspan="3" align="center" class="value" width="45%">
													<xsl:apply-templates select="RegBG:AppOrganizationInfo/RegBG:Address"/>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>телефон ответственного лица</xsl:text>
												</td>
												<td width="5%"/>
												<td colspan="3" align="center" class="value" width="45%">
													<xsl:for-each select="RegBG:AppOrganizationInfo/RegBG:Contact/cat_ru:Phone">
														<xsl:if test="position()!=1">; </xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="50%">
													<xsl:text>адрес электронной почты</xsl:text>
												</td>
												<td width="5%"/>
												<td colspan="3" align="center" class="value" width="45%">
													<xsl:for-each select="RegBG:AppOrganizationInfo/RegBG:Contact/cat_ru:E_mail">
														<xsl:if test="position()!=1">; </xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/><br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td class="value" align="center" width="36%">
													<xsl:value-of select="RegBG:AppOrganizationEmployee/cat_ru:PersonPost"/>
												</td>
												<td width="5%"/>
												<td class="value" width="20%"/>
												<td width="5%"/>
												<td class="value" align="center" width="34%">
													<xsl:value-of select="substring(RegBG:AppOrganizationEmployee/cat_ru:PersonName,1,1)"/>
													<xsl:text>.</xsl:text>
													<xsl:if test="RegBG:AppOrganizationEmployee/cat_ru:PersonMiddleName">
														<xsl:value-of select="substring(RegBG:AppOrganizationEmployee/cat_ru:PersonMiddleName,1,1)"/>
														<xsl:text>.</xsl:text>
													</xsl:if>
													<xsl:text> </xsl:text>
													<xsl:value-of select="RegBG:AppOrganizationEmployee/cat_ru:PersonSurname"/>
												</td>
											</tr>
											<tr>
												<td class="descr" valign="top"><xsl:text>(наименование должности руководителя либо лица, им уполномоченного)</xsl:text></td>
												<td/>
												<td class="descr" valign="top"><xsl:text>(подпись)</xsl:text></td>
												<td/>
												<td class="descr" valign="top"><xsl:text>(инициалы, фамилия)</xsl:text></td>
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
												<td colspan="3" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center" class="graphMain" width="50%">
													<xsl:text>М.П.</xsl:text>
												</td>
												<td width="50%"/>
											</tr>
											<tr>
												<td colspan="3" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center" class="descr" width="50%">
													<xsl:text>(при наличии печати)</xsl:text>
												</td>
												<td width="50%"/>
											</tr>
											<tr>
												<td colspan="3" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" class="graphMain" width="25%">
													<xsl:text>дата заполнения</xsl:text>
												</td>
												<td align="center" class="value" width="25%">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="RegBG:ApplicationDate"/>
													</xsl:call-template>
												</td>
												<td width="50%"/>
											</tr>
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

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RegBG:AppOrganizationInfo/RegBG:Address">
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
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
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
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
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
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value" align="center" style="text-align: center;">
						<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($dateIn,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
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