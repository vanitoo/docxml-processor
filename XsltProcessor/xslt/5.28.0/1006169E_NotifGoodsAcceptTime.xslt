<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ngact="urn:customs.ru:Information:CustomsDocuments:NotifGoodsAcceptTime:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
	<xsl:template match="//*[local-name()='NotifGoodsAcceptTime']//*" priority="-1">
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
	<xsl:template match="ngact:NotifGoodsAcceptTime">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Сведения из реестра транспортного контроля</title>
				<style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					height: 297mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-family: Arial, serif;
				}
				
				.auxiliary tbody tr td {
					border: 0;
				}
			</style>
			</head>
			<body>
				<div class="page">
					<h1>Уведомление о дате и времени принятия товаров от перевозчика</h1>
					<span class="header">Дата, время принятия принятия товаров от перевозчика </span>
					<xsl:apply-templates select="ngact:Date" mode="russian_date"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:if test="ngact:Time">
						<xsl:value-of select="substring(ngact:Time, 1, 8)"/>
					</xsl:if>
					<br/>
					<br/>
					<xsl:if test="ngact:PrecedingNotifNumber">
						<span class="header">Регистрационный номер исходного уведомления </span>
						<xsl:apply-templates select="ngact:PrecedingNotifNumber"/>
						<br/>
						<br/>
					</xsl:if>
					<span class="header">Уполномоченный экономический оператор</span>
					<br/>
					<xsl:apply-templates select="ngact:EconomicOperator"/>
					<br/>
					<br/>
					<span class="header">Перевозчик</span>
					<br/>
					<xsl:apply-templates select="ngact:Carrier"/>
					<br/>
					<br/>
					<span class="header">Транспортное средство</span>
					<br/>
					<xsl:apply-templates select="ngact:Transport"/>
					<span class="header">Документы</span>
					<br/>
					<xsl:apply-templates select="ngact:Document"/>
					<br/>
					<xsl:apply-templates select="ngact:NotifPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ngact:Document">
		<span>
			<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<xsl:text>, от </xsl:text>
				<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
			</xsl:if>
		</span>
		<br/>
	</xsl:template>
	<xsl:template match="ngact:EconomicOperator | ngact:Carrier">
		<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
			<br/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<br/>
		Код страны:
		<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<br/>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<br/>
		Наименование ОПФ:
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<br/>
		УИТН:
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<br/>
		УИ ФЛ:
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<span>Адрес: </span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<br/>
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<br/>
			<span>ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<br/>
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span>УНП: <xsl:apply-templates select="cat_ru:UNP"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span>Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span>БИН: <xsl:apply-templates select="cat_ru:BIN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<br/>
			<span>ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
			</span>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<br/>
			<span>	
			ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
							<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
						</xsl:choose>
					</element>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
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
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
									<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
								</xsl:choose>
							</element>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:apply-templates select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:apply-templates select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:text> Документ, удостоверяющий личность: </xsl:text>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ngact:Transport">
		<xsl:if test="cat_ru:TransportModeCode">
		Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров: 
		<xsl:apply-templates select="cat_ru:TransportModeCode"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:TransportNationalityCode">
		Буквенный код страны принадлежности транспортных средств по классификатору стран мира: 
		<xsl:apply-templates select="cat_ru:TransportNationalityCode"/>
			<br/>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="ngact:TransportMeans"/>
		<br/>
	</xsl:template>
	<xsl:template match="ngact:TransportMeans">
		<table border="0" class="auxiliary">
			<!-- вставить в <style/>	.auxiliary tbody tr td { border: 0; } -->
			<tbody>
				<tr>
					<td>
						<xsl:if test="cat_ru:VIN">Номер шасси <xsl:apply-templates select="cat_ru:VIN"/>
							<br/>
						</xsl:if>
						<xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:apply-templates select="cat_ru:TransportKindCode"/>
							<br/>
						</xsl:if>
						<xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:apply-templates select="cat_ru:TransportMarkCode"/>
							<br/>
						</xsl:if>
					</td>
					<td>
						<xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:apply-templates select="cat_ru:TransportIdentifier"/>
							<br/>
						</xsl:if>
						<xsl:if test="cat_ru:TransportMeansNationalityCode">
						Код страны принадлежности ТС 
						<xsl:apply-templates select="cat_ru:TransportMeansNationalityCode"/>
							<br/>
						</xsl:if>
						<xsl:if test="cat_ru:ActiveTransportIdentifier">
						Идентификатор активного ТС  
						<xsl:apply-templates select="cat_ru:ActiveTransportIdentifier"/>
							<br/>
						</xsl:if>
						<xsl:if test="cat_ru:TransportRegNumber">
						Номер свидетельства о регистрации ТС 
						<xsl:apply-templates select="cat_ru:TransportRegNumber"/>
							<br/>
						</xsl:if>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template match="ngact:NotifPerson">
		<!--ФИО - отдельные поля-->
		<table border="0" style="margin-top:50px; width:100%">
			<tbody>
				<tr>
					<td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates select="cat_ru:PersonName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
					</td>
					<td style="border:0; " width="40px"/>
					<td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom" width="25%">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</td>
					<td style="border:0; " width="40px"/>
					<td align="center" style="border-right:0; border-left:0; border-top:0; vertical-align:bottom" width="25%">
						<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
					</td>
				</tr>
				<tr>
					<td align="center" class="low" style="border:0;">Ф.И.О. лица, установившего факт нарушения средств идентификации</td>
					<td style="border:0;"/>
					<td align="center" class="low" style="border:0;">Должность</td>
					<td style="border:0;"/>
					<td align="center" class="low" style="border:0;">Дата подписания</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
