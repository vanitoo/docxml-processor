<?xml version="1.0" encoding="utf-8"?>
<!--Проект приказа Министерства финансов Российской Федерации "Об утверждении Порядка применения способов идентификации товаров, помещаемых (помещенных) под отдельные таможенные процедуры, и совершения таможенных операций с ними"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:lp_gid="urn:customs.ru:Information:CustomsDocuments:LongProc_GoodsIdentify:5.28.0">
	<!-- Шаблон для типа LongProc_GoodsIdentifyType -->
	<xsl:template match="lp_gid:LongProc_GoodsIdentify">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
						font-family: Arial;
					}

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
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 10pt;}

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

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.descr
					{font-size: 8pt;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Заявление о проведении идентификации товаров</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="left" valign="top">
								<td style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="lp_gid:Declarant"/>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td class="descr">Для юридического лица: полное и сокращенное (при наличии) наименование в соответствии со сведениями Единого государственного реестра юридических лиц, основной государственный регистрационный номер, идентификационный номер налогоплательщика, код причины постановки на учет в налоговом органе, адрес в пределах местонахождения, включая почтовый  индекс нахождения юридического лица, регистрационный номер таможенного представителя 
(в случае совершения таможенных операций от имени декларанта)<br/><br/>
Для физического лица: фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства или адрес регистрации по месту пребывания, идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя, сведения о документе, удостоверяющем личность физического лица
</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td colspan="9">Сведения о товарах</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered annot">№ п/п</td>
								<td class="bordered annot">Наименование (фирменное, коммерческое обозначение или иное традиционное наименование) товара и сведения о производителе (изготовителе) (при наличии сведений о нем), товарных знаках, марках, моделях, артикулах, сортах, стандартах и иных технических и коммерческих характеристиках</td>
								<td class="bordered annot">Страна проис- хождения</td>
								<td class="bordered annot">Количество товара в основной и дополнительной единицах измерения</td>
								<td class="bordered annot">Код ТН ВЭД</td>
								<td class="bordered annot">Способ идентификации товара</td>
								<td class="bordered annot">Таможенная процедура, под которую будут помещены товары</td>
								<td class="bordered annot">Адрес место-<br/>нахождения товаров</td>
								<td class="bordered annot">Иные сведения</td>
							</tr>
							<xsl:variable name="rowSpan">
								<xsl:choose>
									<xsl:when test="count(lp_gid:GoodsIdentif) &lt; 1">1</xsl:when>
									<xsl:otherwise><xsl:value-of select="count(lp_gid:GoodsIdentif)"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:for-each select="lp_gid:GoodsIdentif">
								<tr valign="top">
									<td class="bordered annot">
										<xsl:apply-templates select="lp_gid:Position"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="." mode="goodsInfo"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="lp_gid:DestinationCountry/*">
											<xsl:if test="position() != 1">, </xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered annot">
										<xsl:text>Брутто </xsl:text><xsl:apply-templates select="lp_gid:GrossWeightQuantity"/><br/>
										<xsl:text>Нетто </xsl:text><xsl:apply-templates select="lp_gid:NetWeightQuantity"/><br/>
										<xsl:if test="lp_gid:GoodsQuantity">
											<xsl:text>ДЕИ </xsl:text><xsl:apply-templates select="lp_gid:GoodsQuantity" mode="quantity"/>
										</xsl:if>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="lp_gid:GoodsTNVEDCode"/>
									</td>
									<td class="bordered annot">
										<xsl:for-each select="lp_gid:IdentifMean/*">
											<xsl:if test="position() != 1">, </xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered annot" align="center">
										<xsl:apply-templates select="lp_gid:CustomsProcedure"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="lp_gid:GoodsLocation/RUDECLcat:UnifiedAddressDetails"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="lp_gid:OtherInfo"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="left">
								<td class="annot">Перечень прилагаемых документов:</td>
							</tr>
							<tr valign="top" align="left">
								<td class="annot" style="border-bottom: 1px solid black;">
									<xsl:for-each select="lp_gid:PresentedDoc">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="." mode="doc"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td class="descr">(указываются документы, используемые при выбранном способе идентификации товаров, уникальный идентификатор каждого документа и идентификатор электронного архива декларанта (при наличии))</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="30%" class="annot" align="center" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="lp_gid:Declarant/lp_gid:AuthorizedPerson/cat_ru:PersonPost"/>
								</td>
								<td width="5%"></td>
								<td width="50%" class="annot" align="center" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="lp_gid:Declarant/lp_gid:AuthorizedPerson/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="lp_gid:Declarant/lp_gid:AuthorizedPerson/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="lp_gid:Declarant/lp_gid:AuthorizedPerson/cat_ru:PersonMiddleName"/>
								</td>
								<td width="5%"></td>
								<td width="10%" class="annot" align="center" style="border-bottom: 1px solid black;"></td>
							</tr>
							<tr align="center">
								<td class="descr">(должность)</td>
								<td></td>
								<td class="descr">(фамилия, имя, отчество (при наличии)</td>
								<td></td>
								<td class="descr">(подпись)</td>
							</tr>
						</tbody>
					</table>
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
		<xsl:if test="lp_gid:ElectronicDoc/lp_gid:DocID">
			<xsl:text>, идентификатор </xsl:text>
			<xsl:apply-templates select="lp_gid:ElectronicDoc/lp_gid:DocID"/>
		</xsl:if>
		<xsl:if test="lp_gid:ElectronicDoc/lp_gid:ArchiveID">
			<xsl:text>, идентификатор архива ЭД </xsl:text>
			<xsl:apply-templates select="lp_gid:ElectronicDoc/lp_gid:ArchiveID"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="lp_gid:GoodsIdentif" mode="goodsInfo">
		<xsl:apply-templates select="lp_gid:GoodsDescription"/>
		<xsl:if test="lp_gid:ManufacturerPerson">
			<xsl:text>, производитель: </xsl:text>
			<xsl:for-each select="lp_gid:ManufacturerPerson/*">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="lp_gid:TrademarkDescription">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:TrademarkDescription"/>
		</xsl:if>
		<xsl:if test="lp_gid:GoodsMark">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:GoodsMark"/>
		</xsl:if>
		<xsl:if test="lp_gid:GoodsModel">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:GoodsModel"/>
		</xsl:if>
		<xsl:if test="lp_gid:GoodsMarking">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="lp_gid:GoodsSort">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:GoodsSort"/>
		</xsl:if>
		<xsl:if test="lp_gid:GoodsStandard">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="lp_gid:ProductionDate">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:ProductionDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="lp_gid:OtherCharacteristics">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="lp_gid:OtherCharacteristics"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="lp_gid:Declarant">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:choose>
			<xsl:when test="lp_gid:TypePerson = 0 or translate(substring(lp_gid:TypePerson, 1, 1),'F', 'f') = 'f'"><!-- ЮЛ -->
				<xsl:if test="cat_ru:ShortName">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:if test="position() = 1">, </xsl:if>
					<xsl:if test="position() != 1">; </xsl:if>
					<xsl:text>Адрес: </xsl:text>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:if test="../lp_gid:CustomsAuthorizedPerson/lp_gid:RegNum">
					<xsl:text>, регистрационный номер таможенного представителя: </xsl:text>
					<xsl:apply-templates select="../lp_gid:CustomsAuthorizedPerson/lp_gid:RegNum"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="lp_gid:TypePerson = 1 or translate(substring(lp_gid:TypePerson, 1, 1),'T', 't') = 't'"><!-- ФЛ -->
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<xsl:if test="position() = 1">, </xsl:if>
					<xsl:if test="position() != 1">; </xsl:if>
					<xsl:text>Адрес: </xsl:text>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCard">
					<xsl:text>, документ, удостоверяющий личность: </xsl:text>
					<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identity"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="identity">
		<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="lp_gid:GoodsLocation/RUDECLcat:UnifiedAddressDetails | RUScat_ru:SubjectAddressDetails">
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
	<!--xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template-->
	<xsl:template name="russian_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='LongProc_GoodsIdentify']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()" />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates />
		</element>
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
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')" />
		</element>
	</xsl:template>
</xsl:stylesheet>