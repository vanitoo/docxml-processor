<?xml version="1.0" encoding="utf-8"?>

<!-- Свободная форма -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.22.0" xmlns:agp="urn:customs.ru:Information:EArchDocuments:AgreementParticipants:5.22.0">
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
	<xsl:template match="//*[local-name()='AgreementParticipants']//*" priority="-1">
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
	<xsl:template match="*" mode="bool">
		<xsl:variable name="xpath_bool">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_bool}">
			<xsl:choose>
				<xsl:when test=".='true' or .=1 or .='t' or .='TRUE' or .='True'"><xsl:text>X</xsl:text></xsl:when>
				<xsl:otherwise><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа AgreementParticipantsType -->
	<xsl:template match="agp:AgreementParticipants">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					white-space: nowrap;
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tr>
							<td align="center" class="graphMain">
								<h3>
									Соглашение о доступе к документам ЭАДД заинтересованных участников ВЭД<br/>
									<xsl:apply-templates select="agp:AgreementParticipants" mode="document"/>
								</h3>
							</td>
						</tr>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ct:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ct:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ct:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="agp:DocBeginDate or agp:DocEndDate">
						<table class="w190" cellspacing="10">
							<tr>
								<td class="annot graphMain" style="width:70%">Период действия Соглашения</td>
								<td class="value graphMain" style="width:30%" align="center">
									<xsl:if test="agp:DocBeginDate"> с 
										<xsl:apply-templates select="agp:DocBeginDate" mode="russian_date"/>
									</xsl:if>
									<xsl:if test="agp:DocEndDate"> по 
										<xsl:apply-templates select="agp:DocEndDate" mode="russian_date"/>
									</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="agp:Participants">
						<div class="title marg-top">Участники Соглашения</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered">ИД внешнего участника обмена</td>
								<td class="graphMain bordered">Наименование организации / ФИО физического лица</td>
								<td class="graphMain bordered">ОГРН/ОГРНИП</td>
								<td class="graphMain bordered">ИНН</td>
								<td class="graphMain bordered">КПП</td>
								<td class="graphMain bordered">Роль организации</td>
							</tr>
							<xsl:for-each select="agp:Participants"><xsl:apply-templates select="."/></xsl:for-each>
						</table>
					</xsl:if>
					<xsl:if test="agp:Agreement">
						<div class="title marg-top">Текст Соглашения</div>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:100%"><xsl:apply-templates select="agp:Agreement"/></td>
							</tr>
						</table>
						<br/>
					</xsl:if>
					<xsl:apply-templates select="agp:AgreementOption"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа agp:AgreementOptionType -->
	<xsl:template match="agp:AgreementOption">
		<xsl:if test="agp:ArchShareDoc">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Обеспечение частичного доступа к документам ЭАДД</td>
					<td class="graphMain bordered" style="width:4%" align="center">
						<xsl:apply-templates select="agp:ArchShareDoc" mode="bool"/>
					</td>	
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="agp:ShareProc">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Предоставление информации о процедуре декларирования</td>
					<td class="graphMain bordered" style="width:4%" align="center">
						<xsl:apply-templates select="agp:ShareProc" mode="bool"/>
					</td>	
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="agp:PaymentFactSign">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Признак возможности оплаты таможенных платежей </td>
					<td class="graphMain bordered" style="width:4%" align="center">
						<xsl:apply-templates select="agp:PaymentFactSign" mode="bool"/>
					</td>	
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>	
		<xsl:if test="agp:DeclBothAgree">
			<table class="w190" cellspacing="10">
				<tr>
					<td class="annot graphMain" style="width:86%">Cогласие что, запрашивающая сторона получит полный доступ к документам ЭАДД</td>
					<td class="graphMain bordered" style="width:4%" align="center">
						<xsl:apply-templates select="agp:DeclBothAgree" mode="bool"/>
					</td>	
					<td class="annot graphMain" style="width:10%"/>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!--xsl:template match="agp:AgreementParticipants"-->
	<xsl:template mode="document" match="agp:AgreementParticipants">
		<xsl:apply-templates select="ct:PrDocumentName" />
		<xsl:if test="ct:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="ct:PrDocumentNumber" />
		</xsl:if>
		<xsl:if test="ct:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="ct:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ct:EADOrgType -->
	<xsl:template match="agp:Participants">
		<tr>
			<td class="graphMain bordered"><xsl:apply-templates select="ct:ParticipantID"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="ct:OrganizationName"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="ct:OGRN"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="ct:INN"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="ct:KPP"/></td>
			<td class="graphMain bordered">
				<xsl:variable name="xpath_Role">
					<xsl:call-template name="get_xpath">
						<xsl:with-param name="node" select="ct:Role"/>
					</xsl:call-template>
				</xsl:variable>
				<element xml_node="{$xpath_Role}">
					<xsl:choose>
						<xsl:when test="ct:Role=0">декларант</xsl:when>
						<xsl:when test="ct:Role=1">таможенный представитель</xsl:when>
						<xsl:when test="ct:Role=2">перевозчик</xsl:when>
						<xsl:otherwise><xsl:value-of select="ct:Role"/></xsl:otherwise>
					</xsl:choose>
				</element>
			</td>
		</tr>
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
