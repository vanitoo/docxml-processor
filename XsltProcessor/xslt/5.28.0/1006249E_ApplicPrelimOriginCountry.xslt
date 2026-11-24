<?xml version="1.0" encoding="utf-8"?>
<!--При EPGUIndicator=0 Приложение №1 Приказ ФТС России от 05.02.2019 № 181-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:apoc="urn:customs.ru:ApplicPrelimOriginCountry:5.24.0">
	<!-- Шаблон для типа ApplicPrelimOriginCountryType -->
	<xsl:template match="apoc:ApplicPrelimOriginCountry">
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

									div.page_album {
									width: 270mm;
									max-width: 270mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-family: Arial;
									}

									div.page{
									width: 180mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-family: Arial;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									.marg-t1
									{
									margin-top:10mm;
									font-family: Arial;
									font-size: 13pt;
									font-variant: small-caps;
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
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}
									

									.graphLittle 
									{
									font-family: Arial;
									font-size: 7pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									font-style: italic;
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

									.delim_3 {
										height: 3pt;
									}

									.graphMain
									{
									font-family: Arial;
									font-size: 11pt;
									}

								</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="(apoc:ApplicationInfo/apoc:EPGUIndicator='0') or (apoc:ApplicationInfo/apoc:EPGUIndicator='false') or (apoc:ApplicationInfo/apoc:EPGUIndicator='f')">
						<div class="page">
							<table class="graphMain">
								<tbody>
									<tr>
										<td align="center" class="graphMain">
											<b>
												<xsl:text>Начальнику (заместителю начальника) Управления товарной номенклатуры</xsl:text>
												<br/>
												<br/>
												<br/>
												<xsl:text/>ЗАЯВЛЕНИЕ №&#160;	&#160;<span class="value">&#160;&#160;<xsl:value-of select="apoc:ApplicationInfo/cat_ru:PrDocumentNumber"/>&#160;&#160;</span>
												<br/>
												<xsl:text> о принятии предварительного решения о происхождении товара</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:if test="apoc:Applicant">
												<xsl:apply-templates select="apoc:Applicant" mode="OrgData"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(фамилия и инициалы заявителя (для физического лица)/наименование организации, должность, фамилия, инициалы руководителя (для юридического лица) или лица, им уполномоченного)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="apoc:Applicant/RUScat_ru:SubjectAddressDetails" mode="AddressStr"/>
											<xsl:if test="apoc:Applicant/apoc:PostalAddress">
												<xsl:if test="apoc:Applicant/RUScat_ru:SubjectAddressDetails"/>
												<xsl:text>; </xsl:text>
												<xsl:text>Почтовый адрес: </xsl:text>
												<xsl:apply-templates select="apoc:Applicant/apoc:PostalAddress" mode="AddressStr"/>
											</xsl:if>
											<xsl:if test="apoc:Applicant/apoc:ForeignLegalInfo/apoc:FullAddressLat">
												<xsl:if test="apoc:Applicant/RUScat_ru:SubjectAddressDetails|apoc:Applicant/apoc:PostalAddress"/>
												<xsl:text>; </xsl:text>
											</xsl:if>
											<xsl:value-of select="apoc:Applicant/apoc:ForeignLegalInfo/apoc:FullAddressLat"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(почтовый адрес (для физического лица)/местонахождение юридического лица и его почтовый адрес)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:apply-templates select="apoc:Applicant/cat_ru:KGOrganizationFeatures"/>
											<xsl:apply-templates select="apoc:Applicant/cat_ru:RAOrganizationFeatures"/>
											<xsl:apply-templates select="apoc:Applicant/cat_ru:RBOrganizationFeatures"/>
											<xsl:apply-templates select="apoc:Applicant/cat_ru:RFOrganizationFeatures"/>
											<xsl:apply-templates select="apoc:Applicant/cat_ru:RKOrganizationFeatures"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(идентификационный номер налогоплательщика - для физического лица; идентификационный номер налогоплательщика/код причины постановки на учет - для юридического лица)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<xsl:if test="apoc:Applicant/RUScat_ru:IdentityCard">
										<tr>
											<td class="value">
												<xsl:apply-templates select="apoc:Applicant/RUScat_ru:IdentityCard" mode="IdentityCardStr"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphLittle">
												<xsl:text>(серия, номер паспорта, кем и когда выдан (для физического лица)</xsl:text>
											</td>
										</tr>
										<tr>
											<td class="delim_3">
												<br/>
												<br/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td style="text-indent : 5%;">
											<xsl:text>Прошу выдать предварительное решение о происхождении указанного ниже товара.</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Описание товара:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates select="apoc:DecisionCountryOrigin/apoc:Goods" mode="GoodsStr"/>
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
											<table>
												<tbody>
													<tr>
														<td width="30%" class="graphMain value" align="center">
															<xsl:value-of select="apoc:ApplicantSignature/cat_ru:PersonPost"/>
														</td>
														<td width="5%"/>
														<td width="30%" class="graphMain value"/>
														<td width="5%"/>
														<td width="30%" class="graphMain value" align="center">
															<xsl:value-of select="apoc:ApplicantSignature/cat_ru:PersonSurname"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="apoc:ApplicantSignature/cat_ru:PersonName"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="apoc:ApplicantSignature/cat_ru:PersonMiddleName"/>
														</td>
													</tr>
													<tr>
														<td class="graphLittle" align="center">(должность)</td>
														<td/>
														<td class="graphLittle" align="center">(подпись заявителя)</td>
														<td/>
														<td class="graphLittle" align="center">(Ф. И. О.)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(печать для юридического лица, для физического лица - подпись, при наличии - печать)</xsl:text>
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
											<xsl:if test="apoc:ApplicantSignature/cat_ru:IssueDate">
												<xsl:call-template name="DateStr">
													<xsl:with-param select="apoc:ApplicantSignature/cat_ru:IssueDate" name="dateIn"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="(apoc:ApplicationInfo/apoc:EPGUIndicator='1') or (apoc:ApplicationInfo/apoc:EPGUIndicator='true') or (apoc:ApplicationInfo/apoc:EPGUIndicator='t')">
						<div class="page_album">
							<table class="w190">
								<tbody>
									<tr>
										<td align="center" class="graphMain">
											<font size="4">
												<b>Заявление на оказание услуги<br/>"ПРИНЯТИЕ ПРЕДВАРИТЕЛЬНЫХ РЕШЕНИЙ О СТРАНЕ ПРОИСХОЖДЕНИЯ ТОВАРА"</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
							<br/>
							<xsl:if test="apoc:Description">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:40%">Примечание</td>
										<td class="value graphMain" style="width:60%">
											<xsl:value-of select="apoc:Description"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="apoc:ApplicationInfo">
								<div class="title marg-t1">Сведения о заявке</div>
								<xsl:apply-templates select="apoc:ApplicationInfo"/>
							</xsl:if>
							<xsl:if test="apoc:Applicant">
								<div class="title marg-t1">Сведения о заявителе</div>
								<xsl:apply-templates select="apoc:Applicant"/>
							</xsl:if>
							<xsl:if test="apoc:AppliedDocument">
								<div class="title marg-t1">Сведения о предоставляемых документах</div>
								<table class="bordered w190">
									<tr class="title">
										<td class="graphMain bordered">Сведения о документе</td>
										<td class="graphMain bordered">Номер файла</td>
										<td class="graphMain bordered">Имя файла</td>
										<td class="graphMain bordered">Расширение файла</td>
										<td class="graphMain bordered">Комментарий</td>
									</tr>
									<xsl:for-each select="apoc:AppliedDocument">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</table>
							</xsl:if>
							<xsl:if test="apoc:DecisionCountryOrigin">
								<div class="title marg-t1">Заявление на  выдачу решения</div>
								<xsl:apply-templates select="apoc:DecisionCountryOrigin"/>
							</xsl:if>
							<xsl:if test="apoc:Alteration">
								<div class="title marg-t1">Заявление на  внесение изменений</div>
								<xsl:apply-templates select="apoc:Alteration"/>
							</xsl:if>
							<xsl:if test="apoc:Duplicate">
								<div class="title marg-t1">Заявление на  выдачу дубликата</div>
								<xsl:apply-templates select="apoc:Duplicate"/>
							</xsl:if>
						</div>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode or RUScat_ru:IdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Документ, удостоверяющего личность. Для РФ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="RUScat_ru:IdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Серия и номер документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
						<xsl:if test="RUScat_ru:IdentityCardNumber"> № <xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата выдачи документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:IssuerCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Организация, выдавшая документ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:OrganizationName"/>
						<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование вида документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:AuthorityId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="IdentityCardStr" match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="AddressStr">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>Код вида адреса:  <xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
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
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails | apoc:PostalAddress">
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOGUID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:value-of select="RUScat_ru:AOID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно - территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:AlterationType -->
	<xsl:template match="apoc:Alteration">
		<xsl:if test="apoc:PreliminaryDecision">
			<div class="title marg-top">Ранее выданное предварительное решение</div>
			<xsl:apply-templates select="apoc:PreliminaryDecision"/>
		</xsl:if>
		<xsl:if test="apoc:Change">
			<div class="title marg-top">Изменяемые сведения</div>
			<xsl:apply-templates select="apoc:Change"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:ApplicantType -->
	<xsl:template match="apoc:Applicant">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации / ФИО физического лица</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код языка для заполнения наименования </td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:OrganizationLanguage"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения об организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Кодовое обозначение страны</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:CountryA2Code"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
						<xsl:if test="RUScat_ru:BusinessEntityTypeName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификационный таможенный номер, присвоенный юридическому или физическому лицу</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:UITN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Уникальный идентификатор физического лица</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="RUScat_ru:PersonId"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<div class="title marg-top">Сведения о документе, удостоверяющем личность физического лица</div>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<div class="title marg-top">Адрес</div>
			<table class="w190">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<tr>
						<td class="annot graphMain" style="width:40%">Вид адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</td>
						<td class="value graphMain" style="width:60%">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="apoc:PostalAddress">
			<div class="title marg-top">Почтовый адрес</div>
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">	Вид адреса: <xsl:value-of select="apoc:PostalAddress/RUScat_ru:AddressKindCode"/>
					</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="apoc:PostalAddress"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Контактный реквизит субъекта</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Идентификатор заявителя</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:ApplicantID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Тип заявителя</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:ApplicantClass"/>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:ApplicantType">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Заявитель является</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:ApplicantType"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:OtherApplicantType">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Укажите, кем является заявитель в случае выбора значения «Иное»</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:OtherApplicantType"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:GeneralNotes">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Примечание</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:GeneralNotes"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:BirthDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Дата рождения.  Указывается для  ФЛ/ИП/ИГ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="apoc:BirthDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:BirthPlace">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Место рождения.Указывается для  ФЛ/ИП/ИГ</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:BirthPlace"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Citizenship">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Гражданство заявителя</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Citizenship"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:LegalInfo">
			<div class="title marg-top">Сведения о юридическом  лице</div>
			<xsl:apply-templates select="apoc:LegalInfo"/>
		</xsl:if>
		<xsl:if test="apoc:ForeignLegalInfo">
			<div class="title marg-top">Сведения о иностранном юридическом  лице</div>
			<xsl:apply-templates select="apoc:ForeignLegalInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:ApplicationInfoType -->
	<xsl:template match="apoc:ApplicationInfo">
		<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование документа</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_ru:PrDocumentName"/>
						<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentDate">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Идентификатор заявления на ЕПГУ</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:ApplicationSourceSystemID"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Идентификатор заявки в АПС "Электронные Госуслуги"</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:ApplicationID"/>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:DepartmentCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Код подразделения, в которое предоставляется заявка</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="apoc:DepartmentCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:AppliedDocumentType -->
	<xsl:template match="apoc:AppliedDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
				<xsl:if test="cat_ru:PrDocumentDate">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate">
					<xsl:text> № </xsl:text>
					<xsl:value-of select="cat_ru:PrDocumentNumber"/>
				</xsl:if>
				<xsl:if test="apoc:DocumentModeCode">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="apoc:DocumentModeCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:Number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:Expansion"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:Description"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа apoc:ChangeType -->
	<xsl:template match="apoc:Change">
		<xsl:if test="apoc:Cause">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Причина</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Cause"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Изменяемые сведения</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:Changes"/>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:Notes">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Примечание</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Notes"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:CountryType -->
	<xsl:template match="apoc:CountryDeclared| apoc:Country">
		<xsl:text>(</xsl:text>
		<xsl:value-of select="apoc:CountryCode"/>
		<xsl:text>) </xsl:text>
		<xsl:value-of select="apoc:CountryName"/>
	</xsl:template>
	<!-- Шаблон для типа apoc:DecisionCountryOriginType -->
	<xsl:template match="apoc:DecisionCountryOrigin">
		<xsl:if test="apoc:Goods">
			<div class="title marg-top">Сведения о товаре</div>
			<xsl:apply-templates select="apoc:Goods"/>
		</xsl:if>
		<xsl:if test="apoc:PreliminaryDecision">
			<div class="title marg-top">Ранее выданное предварительное решение</div>
			<xsl:apply-templates select="apoc:PreliminaryDecision"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="apoc:DepartmentCode">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:DuplicateType -->
	<xsl:template match="apoc:Duplicate">
		<xsl:if test="apoc:Cause">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Причина</td>
					<td class="graphMain value" style="width:60%">
						<xsl:for-each select="apoc:Cause">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Notes">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Примечание</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Notes"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Наименование товара</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:GoodsName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:GoodsDescription">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Описание товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:GoodsDescription"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:PreliminaryDecision">
			<div class="title marg-top">Ранее выданное предварительное решение</div>
			<xsl:apply-templates select="apoc:PreliminaryDecision"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="OrgAddress">
		<xsl:apply-templates mode="AddressStr" select="RUScat_ru:SubjectAddressDetails"/>
	</xsl:template>
	<xsl:template match="*" mode="OrgData">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">) </xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="apoc:LegalInfo">
			<xsl:if test="apoc:LegalInfo/apoc:OrganizationHead">
				<xsl:apply-templates select="apoc:LegalInfo/apoc:OrganizationHead"/>
			</xsl:if>
			<xsl:if test="apoc:LegalInfo/apoc:OrganizationDeputyHead">
				<xsl:if test="apoc:LegalInfo/apoc:OrganizationHead">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="apoc:LegalInfo/apoc:OrganizationDeputyHead"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="apoc:ForeignLegalInfo">
			<xsl:if test="apoc:ForeignLegalInfo/apoc:FullNameLat">
				<xsl:value-of select="apoc:ForeignLegalInfo/apoc:FullNameLat"/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="apoc:ForeignLegalInfo/apoc:ShortNameForeign"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
			<xsl:if test="apoc:ForeignLegalInfo/apoc:OPFLat">
				<xsl:text>(</xsl:text>
				<xsl:value-of select="apoc:ForeignLegalInfo/apoc:OPFLat"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:ForeignLegalInfoType -->
	<xsl:template match="apoc:ForeignLegalInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Наименование на иностранном языке (в  латинской транскрипции)</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:FullNameLat"/>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="apoc:ShortNameForeign"/>
					<xsl:text>)</xsl:text>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Организационно-правовая форма (в латинской транскрипции)</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:OPFLat"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Место регистрации</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:PlaceReg"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Полный адрес организации (на иностранном языке)</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:FullAddressLat"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа apoc:GoodsType -->
	<xsl:template match="apoc:Goods">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Наименование товара</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:GoodsName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:GoodsFirmName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Фирменное наименование товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:GoodsFirmName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Purpose">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Назначение товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Purpose"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Kind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сорт товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Kind"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Mark">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Марка товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Mark"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Model">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Модель товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Model"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Article">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Артикул товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:Article"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:OtherInformation">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Другие сведения о товаре, позволяющие его идентифицировать</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:OtherInformation"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Код ТН ВЭД ЕАЭС</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:TNVEDCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Описание упаковки</td>
				<td class="graphMain value" style="width:60%">
					<xsl:for-each select="apoc:PackageDescription">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Коммерческое назначение и другая дополнительная информация</td>
				<td class="graphMain value" style="width:60%">
					<xsl:for-each select="apoc:CommercialPurpose">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:MakingProcessDescription">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Описание технологического процесса изготовления товара</td>
					<td class="graphMain value" style="width:60%">
						<xsl:for-each select="apoc:MakingProcessDescription">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:ExternalEconomicDeal">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения о внешнеэкономической сделке (если имеются)</td>
					<td class="graphMain value" style="width:60%">
						<xsl:for-each select="apoc:ExternalEconomicDeal">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:GoodsNotes">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Примечание</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="apoc:GoodsNotes"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:CountryDeclared">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Заявляемая страна происхождения товара</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="apoc:CountryDeclared"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:PPR">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Реквизиты решения</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="apoc:PPR"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<div class="title marg-top">Сведения о материалах, из которых изготовлен товар</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Наименование материала</td>
					<td class="graphMain bordered">Код ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered">Стоимость</td>
					<td class="graphMain bordered">Код валюты</td>
					<td class="graphMain bordered">Страна происхождения</td>
				</tr>
				<xsl:for-each select="apoc:Materials">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="GoodsStr" match="apoc:Goods">
		<table class="graphMain">
			<tbody>
				<tr>
					<td>
						<xsl:text>1)&#160;</xsl:text>
						<xsl:text>коммерческое и фирменное нименование (товарный знак): </xsl:text>
						<span>
							<i>
								<xsl:value-of select="apoc:GoodsName"/>
								<xsl:if test="apoc:GoodsFirmName">
									<xsl:if test="apoc:GoodsName">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
									<xsl:value-of select="apoc:GoodsFirmName"/>
									<xsl:if test="apoc:GoodsName">) </xsl:if>
								</xsl:if>
								<xsl:text>;</xsl:text>
							</i>
						</span>
					</td>
				</tr>
				<tr>
					<td class="delim_3"/>
				</tr>
				<tr>
					<td>
						<xsl:text>2)&#160;основные  технические и коммерческие характеристики: </xsl:text>
						<span>
							<i>
								<xsl:for-each select="apoc:Purpose | apoc:Kind | apoc:Mark | apoc:Model | apoc:Article | apoc:PackageDescription | apoc:OtherInformation">
									<xsl:if test="position() > 1">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:apply-templates select="."/>
								</xsl:for-each>
								<xsl:text>;</xsl:text>
							</i>
						</span>
					</td>
				</tr>
				<tr>
					<td class="delim_3"/>
				</tr>
				<tr>
					<td>
						<xsl:text>3)&#160;</xsl:text>
						<xsl:if test="apoc:TNVEDCode">
							<xsl:text>код ТН ВЭД:</xsl:text>
							<span>
								<i>
									<xsl:value-of select="apoc:TNVEDCode"/>
								</i>
							</span>
						</xsl:if>
						<xsl:if test="apoc:Amount">
							<xsl:text>,&#160;</xsl:text>
							<xsl:text>стоимость: </xsl:text>
							<span>
								<i>
									<xsl:value-of select="apoc:Amount/RUScat_ru:Amount"/>
									<xsl:text>&#160;(</xsl:text>
									<xsl:value-of select="apoc:Amount/RUScat_ru:CurrencyCode"/>
									<xsl:text>)</xsl:text>
									<xsl:text>;</xsl:text>
								</i>
							</span>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="delim_3"/>
				</tr>
				<tr>
					<td>
						<xsl:text>4)&#160;материалы: </xsl:text>
						<span>
							<i>
								<xsl:for-each select="apoc:Materials">
									<xsl:value-of select="position()"/>
									<xsl:text>:&#160;</xsl:text>
									<xsl:value-of select="apoc:Name"/>
									<xsl:if test="apoc:TNVEDCode">
										<xsl:if test="apoc:Name">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
										<xsl:value-of select="apoc:TNVEDCode"/>
										<xsl:if test="apoc:Name">) </xsl:if>
									</xsl:if>
									<xsl:value-of select="apoc:Price"/>
									<xsl:if test="apoc:CurrencyCode">
										<xsl:if test="apoc:Price">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
										<xsl:value-of select="apoc:CurrencyCode"/>
										<xsl:if test="apoc:Price">) </xsl:if>
									</xsl:if>
									<xsl:value-of select="apoc:Country/apoc:CountryName"/>
									<xsl:if test="apoc:Country/apoc:CountryCode">
										<xsl:if test="apoc:Country/apoc:CountryName">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
										<xsl:value-of select="apoc:Country/apoc:CountryCode"/>
										<xsl:if test="apoc:Country/apoc:CountryName">)</xsl:if>
									</xsl:if>
									<xsl:text>;</xsl:text>
									<br/>
								</xsl:for-each>
							</i>
						</span>
					</td>
				</tr>
				<tr>
					<td class="delim_3"/>
				</tr>
				<tr>
					<td>
						<xsl:text>5)&#160;производственные и технологические  операции: </xsl:text>
						<span>
							<i>
								<xsl:for-each select="apoc:MakingProcessDescription">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>&#160;</xsl:text>
									</xsl:if>
								</xsl:for-each>
							</i>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа apoc:LegalInfoType -->
	<xsl:template match="apoc:LegalInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Организационно-правовая форма</td>
				<td class="value graphMain" style="width:60%">
					<xsl:value-of select="apoc:OPF"/>
				</td>
			</tr>
		</table>
		<xsl:if test="apoc:RegistrationNumber or apoc:RegistrationDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Номер и дата государственной регистрации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:if test="apoc:RegistrationNumber">№ <xsl:value-of select="apoc:RegistrationNumber"/>
						</xsl:if>
						<xsl:if test="apoc:RegistrationDate">
							<xsl:text> дата: </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="apoc:RegistrationDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:OrganizationHead">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения о руководителе организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="apoc:OrganizationHead"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:OrganizationDeputyHead">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Сведения о зам.руководителе организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:apply-templates select="apoc:OrganizationDeputyHead"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:MaterialType -->
	<xsl:template match="apoc:Materials">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:Name"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:TNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(apoc:Price, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="apoc:CurrencyCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="apoc:Country"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="apoc:OrganizationDeputyHead| apoc:OrganizationHead">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="apoc:PPR">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа apoc:PreliminaryDecisionType -->
	<xsl:template match="apoc:PreliminaryDecision">
		<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование документа</td>
					<td class="graphMain value" style="width:60%">
						<xsl:if test="cat_ru:PrDocumentName">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentNumber">
							<xsl:text>№ </xsl:text>
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="cat_ru:PrDocumentDate">
							<xsl:text>от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:OrderNumber or apoc:OrderDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Письмо ФТС о выдаче предварительного решения</td>
					<td class="graphMain value" style="width:60%">
						<xsl:if test="apoc:OrderNumber">№ <xsl:value-of select="apoc:OrderNumber"/>
						</xsl:if>
						<xsl:if test="apoc:OrderDate">
							<xsl:text> от </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="apoc:OrderDate"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="apoc:Description">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Описание товара</td>
					<td class="graphMain value" style="width:60%">
						<xsl:for-each select="apoc:Description">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="commaSeparated">
		<xsl:if test="position() > 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="dateIn"/>
		<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;	<xsl:choose>
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
		</xsl:choose>				&#160;<xsl:value-of select="substring($dateIn,1,4)"/>&#160;г.&#160;
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
