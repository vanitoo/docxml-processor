<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 111н от 18 июля 2022 года "Об установлении Порядка принятия и выдачи предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию, а также принятия решения о прекращении действия предварительного решения". Приложение №1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cvua="urn:customs.ru:Information:ExchangeDocuments:CustomsValueUsagePrelimApplication:5.25.0">
	<!-- Шаблон для типа CustomsValueUsagePrelimApplicationType -->
	<xsl:template match="cvua:CustomsValueUsagePrelimApplication">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{/*white-space: normal;*/}

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
					font-family: Arial;
					font-size: 10pt;
					/*font-style: italic;*/}

					.annot
					{font-family: Arial;
					font-size: 10pt;}

					.descr
					{font-family: Arial;
					font-size: 7pt;
					text-align: center}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 10pt;}

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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="60%">
									<table>
										<tbody>
											<tr>
												<td align="right" valign="middle">
													<xsl:text>Начальнику (руководителю)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="5%"/>
								<td width="35%">
									<table>
										<tbody>
											<tr>
												<td class="value" align="center" valign="top">
													<xsl:apply-templates select="cvua:Customs"/>
												</td>
											</tr>
											<tr>
												<td class="descr" align="center">(наименование таможенного органа)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<xsl:text>Заявление № </xsl:text>
									<xsl:choose>
										<xsl:when test="cvua:AppSerialNumber">
											<xsl:value-of select="cvua:AppSerialNumber"/>
										</xsl:when>
										<xsl:otherwise>______</xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:text>о принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="cvua:OrganizationInfo/cat_ru:OrganizationName"/>
											<xsl:if test="cvua:OrganizationInfo/cat_ru:ShortName">
												<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="cvua:OrganizationInfo/cat_ru:ShortName"/>
											</xsl:if>
											<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName or cvua:OrganizationInfo/cat_ru:ShortName">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:if test="cvua:ApplicantSigning/cat_ru:PersonSurname">
												<xsl:value-of select="cvua:ApplicantSigning/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:if test="cvua:ApplicantSigning/cat_ru:PersonName">
												<xsl:apply-templates select="cvua:ApplicantSigning/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:if test="cvua:ApplicantSigning/cat_ru:PersonMiddleName">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="cvua:ApplicantSigning/cat_ru:PersonMiddleName"/>
											</xsl:if>
											<xsl:if test="cvua:ApplicantSigning/cat_ru:PersonPost">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cvua:ApplicantSigning/cat_ru:PersonPost"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(полное и краткое наименование организации либо фамилия, имя, отчество (при наличии) заявителя (для физического лица), должность, фамилия, имя, отчество (при наличии) руководителя (для юридического лица), фамилия, имя, отчество (при наличии) уполномоченного представителя)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="cvua:OrganizationInfo/RUScat_ru:SubjectAddressDetails">
												<xsl:if test="position()!=1">
													<xsl:text>; </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(почтовый адрес (для физического лица)/место нахождения юридического лица и его почтовый адрес)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
												<xsl:text> ИНН - </xsl:text>
												<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
												<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:text> ОГРН/ОГРНИП - </xsl:text>
												<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
											</xsl:if>
											<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
												<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN or cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:text> КПП - </xsl:text>
												<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(идентификационный номер налогоплательщика (далее - ИНН), основной государственный регистрационный номер индивидуального предпринимателя - для физического лица; ИНН/код причины постановки на учет - для юридического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="cvua:OrganizationInfo/RUScat_ru:IdentityCard" mode="identity_card"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(серия, номер паспорта, кем и когда выдан (для физического лица))'"/>
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
								<td style="text-align:justify;">
									<xsl:text>Прошу выдать предварительное решение по вопросам применения методов определения таможенной стоимости (далее - предварительное решение) в отношении следующих товаров:</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="cvua:GoodInfo/cvua:TradeName"/>
											<xsl:text>; </xsl:text>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:CommercialName"/>
											<xsl:text>; </xsl:text>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsDescription"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(торговое, коммерческое наименование и краткое описание товаров)'"/>
										<xsl:with-param name="comma" select="1"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>объект интеллектуальной собственности </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="cvua:TradeMark"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="comma" select="1"/>
										<xsl:with-param name="width" select="'65mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>ввозимых в Российскую Федерацию (далее - ввозимые товары) в соответствии с договором (контрактом) купли-продажи от </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:GoodInfo/cvua:PurchaseAgreement/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'30mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>№ </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="cvua:GoodInfo/cvua:PurchaseAgreement/cat_ru:PrDocumentNumber"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'60mm'"/>
									</xsl:call-template>
									<xsl:text>, заключенным с </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="cvua:GoodInfo/cvua:OrganizationSeller"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(полное наименование продавца)'"/>
										<xsl:with-param name="width" select="'125mm'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Номер (при наличии) и дата внешнеэкономического договора купли-продажи (договора поставки), а также номера (при наличии) и даты действующих приложений и изменений к нему, содержащих условия, имеющие отношение к ввозимым товарам</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:apply-templates select="cvua:GoodInfo/cvua:ForeignPurchaseAgreementInfo" mode="doc"/>
									<xsl:if test="cvua:GoodInfo/cvua:ForeignPurchaseAttachments">
										<br/>
										<xsl:for-each select="cvua:GoodInfo/cvua:ForeignPurchaseAttachments">
											<br/>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Номер (при наличии) и дата Лицензионного договора, а также номера (при наличии) и даты действующих приложений и изменений к нему</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:apply-templates select="cvua:GoodInfo/cvua:LicenseAgreementInfo" mode="doc"/>
									<xsl:if test="cvua:GoodInfo/cvua:LicenseAttachments">
										<br/>
										<xsl:for-each select="cvua:GoodInfo/cvua:LicenseAttachments">
											<br/>
											<xsl:apply-templates select="." mode="doc"/>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Сведения о наличии/отсутствии взаимосвязи между продавцом, покупателем, производителем, правообладателем (лицензиаром) (в случае наличия указать взаимосвязанные лица)</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:choose>
										<xsl:when test="cvua:GoodInfo/cvua:RelationshipsInfo/cvua:RelationExistsIndicator='1' or cvua:GoodInfo/cvua:RelationshipsInfo/cvua:RelationExistsIndicator='t' or cvua:GoodInfo/cvua:RelationshipsInfo/cvua:RelationExistsIndicator='true'">
											<xsl:choose>
												<xsl:when test="cvua:GoodInfo/cvua:RelationshipsInfo/cvua:RelationDescription">
													<xsl:apply-templates select="cvua:GoodInfo/cvua:RelationshipsInfo/cvua:RelationDescription"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Взаимосвязь есть</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>Взаимосвязи нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Метод определения таможенной стоимости ввозимых товаров, которым, по мнению заявителя, может быть определена таможенная стоимость ввозимых товаров</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:apply-templates select="cvua:GoodInfo/cvua:CustomsCostMethod"/>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Причины, по которым лицензионные платежи, по мнению заявителя, не включаются в таможенную стоимость ввозимых товаров</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:apply-templates select="cvua:GoodInfo/cvua:LicenseFeesNotIncludeReasons"/>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Сведения о ранее принятом предварительном решении (при наличии)</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:apply-templates select="cvua:GoodInfo/cvua:PrevPreliminaryDecisionInfo"/>
								</td>
							</tr>
							<tr valign="top" align="left">
								<td class="bordered annot" width="60%">
									<xsl:text>Информация, имеющая значение, по мнению заявителя, для принятия предварительного решения</xsl:text>
								</td>
								<td class="bordered annot" width="40%">
									<xsl:apply-templates select="cvua:GoodInfo/cvua:AdditionalInfo"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align:justify;">
									<xsl:text>Опись документов и (или) сведений, размещенных в информационном сервисе "Электронный архив документов декларанта" (далее - ЭАДД) из состава автоматизированной подсистемы "Личный кабинет", размещенной в информационно-телекоммуникационной сети "Интернет", представленных в целях принятия предварительного решения</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered annot">№ п/п</td>
								<td class="bordered annot">Код документа и (или) сведений в соответствии с классификатором видов документов и сведений</td>
								<td class="bordered annot">Наименование документа и (или) сведений</td>
								<td class="bordered annot">Номер документа и (или) сведений (при наличии)</td>
								<td class="bordered annot">Дата документа и (или) сведений (при наличии)</td>
								<td class="bordered annot">Идентификационный номер, автоматически присваиваемый документу после его размещения в ЭАДД</td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered annot">1</td>
								<td class="bordered annot">2</td>
								<td class="bordered annot">3</td>
								<td class="bordered annot">4</td>
								<td class="bordered annot">5</td>
								<td class="bordered annot">6</td>
							</tr>
							<xsl:for-each select="cvua:AttachedDocuments">
								<tr valign="top">
									<td class="bordered annot">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cvua:DocCode"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered annot">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cvua:ArchDocID"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align:justify;">
									<xsl:text>Согласие на обработку персональных данных.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:for-each select="cvua:ApplicantSigning">
						<table>
							<tbody>
								<tr valign="bottom" align="center">
									<td class="value" width="15%"></td>
									<td width="5%"/>
									<td class="value" width="45%">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</td>
									<td width="5%"/>
									<td class="value" width="30%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="RUScat_ru:SigningDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="center">
									<td class="descr" width="15%">Подпись</td>
									<td width="5%"/>
									<td class="descr" width="45%">Фамилия, имя, отчество (при наличии)</td>
									<td width="5%"/>
									<td class="descr" width="30%">(число, месяц, год)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="identity_card">
		<xsl:text> документ: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="cvua:OrganizationInfo/RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:choose>
				<xsl:when test="RUScat_ru:AddressKindCode = 1">адрес регистрации: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode = 2">фактический адрес: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode = 3">почтовый адрес: </xsl:when>
				<xsl:otherwise>
					<xsl:text>(код вида адреса: </xsl:text>
					<xsl:apply-templates select="RUScat_ru:AddressKindCode"/>
					<xsl:text>) </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:apply-templates select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:AddressText)">
			<xsl:if test="RUScat_ru:PostalCode">
				<xsl:apply-templates select="RUScat_ru:PostalCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:CounryName"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Region"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:District"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Town"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:City"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:House"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Room"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<xsl:text>, ОКТМО </xsl:text>
				<xsl:apply-templates select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<xsl:text>, ОKАTO </xsl:text>
				<xsl:apply-templates select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<xsl:text>, КЛАДР </xsl:text>
				<xsl:apply-templates select="RUScat_ru:KLADR"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<xsl:text>, Глобальный идентификатор адресного объекта по ФИАС </xsl:text>
				<xsl:apply-templates select="RUScat_ru:AOGUID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<xsl:text>, Код единицы административно-территориального деления </xsl:text>
				<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<xsl:text>, а/я </xsl:text>
				<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cvua:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
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

	<xsl:template match="//*[local-name()='CustomsValueUsagePrelimApplication']//*" priority="-1">
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
</xsl:stylesheet>
