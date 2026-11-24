<?xml version="1.0" encoding="UTF-8"?>
<!--
	ZoneKind = 1	-	приказ 74н, приложение 2
	ZoneKind = 2	-	приказ 70н, приложение 3
	ZoneKind = 3,4	-	приказ 71н, приложение 2
-->
<xsl:stylesheet version="1.0" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" 
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" 
	xmlns:exnot="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportNotif:5.28.0" 
	xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.26.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes"/>
	
	<xsl:param name="OEZ_NotifReg"/>
	
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
	<xsl:template match="//*[local-name()='OEZ_ExportNotif']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn2" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_dt">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_dt">
				<xsl:with-param name="dateIn3" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="exnot:OEZ_ExportNotif">
		<html>
			<head>
				<title>Уведомление о вывозе товаров с территории особой экономической зоны</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							font-size: 11pt;
							font-family: Arial;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						table
							{
							table-layout: fixed;
							width: 100%;
							border: 0;
							/*empty-cells: show;*/
							border-collapse: collapse;
							margin-top: 0px;
							}
						td {
							font-family:Arial;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
						.graph {
							font-family: Arial;
							font-size: 10pt;
							font-weight: bold;
							}
						.graphMain {
							font-family: Arial;
							font-size: 10pt;
							font-weight: normal;
							}
						
						.graphMainbold {
							font-family: Arial;
							font-size: 10pt;
							font-weight:bold;
							}
						.graphLittle {
							font-family: Arial;
							font-size: 7pt;
							}
						.graph8Bold {
							font-family: Arial;
							font-size: 10pt;
							font-weight: bold;
							}				
						.bordered {
							border-bottom: solid 1pt #000000;
							font-weight: bold;
							}	
						.borderednormal {
							border-bottom: solid 1pt #000000;
							font-weight: normal;
							}
					
						.tdBorder {
							border: 1px solid black;
							}
						.incline{
							font-style: italic;
						}
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
						
						.value
						{border-bottom: solid 1px black;
						font-style: italic;
						vertical-align:bottom;}
						
						.descr
						{font-size: 7pt;
						text-align: center;
						vertical-align:top;}
						
						.squareCheckX {
							display: inline-block;
							width: 4mm;
							height: 4mm;
							border: 1px solid black;
							text-align: center;
						}
                </style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:297mm;">
						<tbody>
							<tr>
								<td colspan="2" style="font-weight: bold;">
									<xsl:if test="exnot:ZoneKind='1'">Уведомление о вывозе товаров с территории особой экономической зоны</xsl:if>
									<xsl:if test="exnot:ZoneKind='2'">Уведомление<br/>о вывозе товаров с территории портовых особых экономических зон, с отдельного участка (отдельных участков) морских портов Республики Крым и городе федерального значения Севастополе, отдельного участка (отдельных участков) морских портов, открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, и (или) с отдельных участков территориий аэропорта, открытого для приема и отправки воздушных судов, выполняющих международные воздушные перевозки, находящихся на территории порта Владивосток или в Арктической зоне Российской Федерации, с земельного участка, прилегающего к автомобильному или железнодорожному пункту пропуска свободного порта Владивосток или Арктической зоны Российской Федерации, на которых применяется таможенная процедура свободной таможенной зоны</xsl:if>
									<xsl:if test="exnot:ZoneKind='3' or exnot:ZoneKind='4'">Уведомление<br/>о вывозе товаров с территории участка, на котором создана зона таможенного контроля для применения таможенной процедуры свободной таможенной зоны, расположенного соответственно на территории опережающего развития, территории свободного порта Владивосток, за исключением участков территории свободного порта Владивосток, определенных в соответствии с частями 3 и 4 статьи 23 Федерального закона от 13 июля 2015 г. № 232-ФЗ "О свободном порте Владивосток", в пределах которых применяется таможенная процедура СТЗ, установленная для портовой особой экономической зоны или логистической особой экономической зоны, участок Арктической зоны Российской Федерации, за исключением участков территории Арктической зоны Российской Федерации, на которых в соответствии с частями 2 и 3 статьи 19 Федерального закона от 13 июля 2020г. № 193-ФЗ "О государственной поддержке предпринимательской деятельности в Арктической зоне Российской Федерации" применяется таможенная процедура свободной таможенной зоны, установленная для отдельных участков морских портов, открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, и (или) отдельных участков территории аэропорта, открытого для приема и отправки воздушных судов, выполняющих международные воздушные перевозки, находящихся в Арктической зоне Российской Федерации, и земельных участков, прилегающих к автомобильному или железнодорожному пункту пропуска Арктической зоны Российской Федерации</xsl:if>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<!--Head-->
								<td align="left" style="width:167mm" valign="top">
									<span style="display:inline-block; width: 100mm; border: 1px solid black;">
										Отметки таможенных органов
										<br/>
										Регистрационный № <xsl:call-template name="NotifNumber"/>
									</span>
								</td>
								<td>
									<table style="width:130mm">
										<tbody>
											<tr>
												<td align="left">
													<span class="incline">B </span>
													<xsl:apply-templates select="exnot:Customs/cat_ru:Code"/> 
													<!--xsl:if test="exnot:ZoneKind!='4'"-->
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="exnot:Customs/cat_ru:OfficeName"/>
													<!--/xsl:if-->
												</td>
											</tr>
											<tr align="center">
												<td class="graphLittle" style="border-top:1pt solid black">(наименование и код таможенного органа)</td>
											</tr>
											<tr>
												<td align="left">
													<span class="incline">От </span>

													<xsl:apply-templates select="exnot:Applicant/cat_ru:OrganizationName"/> 
													<xsl:if test="exnot:Applicant/exnot:Address">
														<xsl:for-each select="exnot:Applicant/exnot:Address">
															<xsl:apply-templates select="." mode="address"/>
														</xsl:for-each> 
													</xsl:if>
													<xsl:if test="exnot:Applicant/cat_ru:RFOrganizationFeatures">
														<xsl:if test="exnot:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="exnot:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
														<xsl:if test="exnot:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="exnot:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
														<xsl:if test="exnot:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="exnot:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
													</xsl:if>
													<xsl:if test="exnot:Applicant/exnot:CertificateNumber">
														свидетельство о включении в реестр № 
														<xsl:apply-templates select="exnot:Applicant/exnot:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
														<xsl:apply-templates select="exnot:Applicant/exnot:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center" style="border-top:1pt solid black">
													<xsl:if test="exnot:ZoneKind='1'">(резидент, подающий уведомление (полное наименование организации, основной государственный регистрационный номер, идентификационный номер налогоплательщика (далее - ИНН), код причины постановки на учет в налоговом органе (далее - КПП), адрес в пределах места нахождения юридического лица - для юридического лица;  фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства или адрес регистрации по месту пребывания, ИНН, основной государственный регистрационный номер индивидуального предпринимателя и сведения о документе, удостоверяющем личность - для физического лица, номер свидительства, удостоверяющего регистрацию лица в качестве резитента особой экономической зоны (далее - ОЭЗ))</xsl:if>
													<xsl:if test="exnot:ZoneKind='2'">(резидент особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) (далее - резидент), или участник свободной экономической зоны (далее - участник), или лицо, которое вправе выступать декларантом товаров, вывозимых с территории портового логистического участка, при завершении действия таможенной процедуры свободной таможенной зоны на основании пункта 3 статьи 202 ТК ЕАЭС (далее - декларант), (полное наименование организации, основной государственный регистрационный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН) и код причины поставновки на учет в налоговом органе (далее - КПП), адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии),  адрес регистрации по месту жительства, ИНН, основной государственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) - для физического лица; регистрационный номер свидетельства, удостоверяющего регистрацию лица в качестве резидента особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации), или свидетельства о включении в единый реестр участников свободной экономической зоны)</xsl:if>
													<xsl:if test="exnot:ZoneKind='3' or exnot:ZoneKind='4'">(резидент территории опережающего развития (территории свободного порта Владивосток, Арктической зоны), (полное наименование организации, основной государстванный регистрационный номер, идентификационный номер налогоплательщика (далее - ИНН), код причины поставновки на учет в налоговом органе (далее - КПП), адрес юридического лица в пределах места нахождения юридического лица - для юридического лица; фамилия, имя отчество (при наличии), адрес регистрации по месту жительства, ИНН, основной государственный регистрационный номер индивидуального предпринимателя и сведения о докумене, удостоверяющем личность - для физического лица; номер свидетельства, удостоверяющего регистрацию лица в качестве резидента территории опережающего развития (свободного порта Владивосток, Арктической зоны Российской Федерации)</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="exnot:ZoneKind = 2">
								<tr>
									<td></td>
									<td align="left">
										<xsl:text>Количество листов </xsl:text>
										<xsl:apply-templates select="exnot:DocPages"/>
									</td>
								</tr>
							</xsl:if>
							<tr align="left" valign="top">
								<td rowspan="2">
									<xsl:text>Вывоз </xsl:text>
									<xsl:choose>
										<xsl:when test="exnot:ZoneKind = 1">(цель подачи уведомления на вывоз товаров)</xsl:when>
										<xsl:when test="exnot:ZoneKind = 3 or exnot:ZoneKind = 4">(цель подачи уведомления)</xsl:when>
									</xsl:choose>
									<xsl:text>:</xsl:text>
									<br/>
									<xsl:choose>
										<xsl:when test="exnot:ZoneKind = 1">
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 1">X</xsl:if></span><xsl:text> товаров</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 2">X</xsl:if></span><xsl:text> порожнего транспортного средства</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 3">X</xsl:if></span><xsl:text> самоходной строительной техники</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 5">X</xsl:if></span><xsl:text> товаров без транспорного средства</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 7">X</xsl:if></span><xsl:text> товаров для совершения операций за пределами особой экономичесекой зоны в соответствии с пунктом 4 статьи 205 Таможенного кодекса Евразийского экономического союза</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 8">X</xsl:if></span><xsl:text> товаров для совершения операций по захоронению, обезвреживанию, утилизации</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 6">X</xsl:if></span><xsl:text> товаров в составе сборного груза</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 9">X</xsl:if></span><xsl:text> товаров для перемещения с одной части территории ОЭЗ на другую часть территории ОЭЗ</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 10">X</xsl:if></span><xsl:text> проб и (или) образцов товаров</xsl:text><br/>
											<!-- <добавлено> -->
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 11">X</xsl:if></span><xsl:text> порожнего транспортного средства (самоходной строительной техники), находящегося (находящейся) во владении резидента, в целях осуществления многократного въезда (выезда)</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 12">X</xsl:if></span><xsl:text> товаров нерезидентом ОЭЗ</xsl:text><br/>
											<!-- </добавлено> -->
											<!-- <добавлено 5.28.0> -->
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 13">X</xsl:if></span><xsl:text> товаров ЕАЭС, являющихся отходами строительства и (или) реконструкции объектов инфраструктуры</xsl:text><br/>
											<!-- </добавлено> -->
										</xsl:when>
										<xsl:when test="exnot:ZoneKind = 2">
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 1">X</xsl:if></span><xsl:text> товаров</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 2">X</xsl:if></span><xsl:text> порожнего транспортного средства</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 3">X</xsl:if></span><xsl:text> самоходной строительной (специальной) техники</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 4">X</xsl:if></span><xsl:text> многоразовый пропуск на автотранспортное средство</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 5">X</xsl:if></span><xsl:text> товаров без транспорного средства</xsl:text><br/>
										</xsl:when>
										<xsl:when test="exnot:ZoneKind = 3 or exnot:ZoneKind = 4">
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 1">X</xsl:if></span><xsl:text> товаров</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 2">X</xsl:if></span><xsl:text> порожнего ТС</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 3">X</xsl:if></span><xsl:text> самоходной строительной техники</xsl:text><br/>
											<span class="squareCheckX"><xsl:if test="exnot:ExportCode = 5">X</xsl:if></span><xsl:text> без транспортного средства</xsl:text><br/>
										</xsl:when>
									</xsl:choose>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="exnot:ZoneKind = 1">Дата планируемого вывоза товаров (выезда транспортного средства):</xsl:when>
										<xsl:when test="exnot:ZoneKind = 2">Дата планируемого вывоза:</xsl:when>
										<xsl:when test="exnot:ZoneKind = 3 or exnot:ZoneKind = 4">Дата планируемого вывоза товаров:</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:apply-templates select="exnot:ExportDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td align="left">
									Получатель<br/>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="exnot:Consignee"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:choose>
														<xsl:when test="exnot:ZoneKind = 1 or exnot:ZoneKind = 3 or exnot:ZoneKind = 4">(полное наименование организации - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства или адрес регистрации по месту пребывания - для физического лица, адрес доставки товаров)</xsl:when>
														<xsl:when test="exnot:ZoneKind = 2">(полное наименование организации, ОГРН, ИНН, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации по месту жителства, ИНН, ОГРНИП - для физического лица)</xsl:when>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="exnot:ZoneKind = 2">
								<tr align="left">
									<td>
										<br/>
										<xsl:text>Резидент/участник, на участке которого находится вывозимый товар</xsl:text>
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="100%;">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="exnot:Resident"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
												</tr>
												<tr align="center">
													<td class="descr" width="100%">
														полное наименование организации, ОГРН, ИНН и КПП, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество при наличии), адрес регистрации по месту жительства, ИНН, ОГРНИП - для физического лица; номер свидетельства, удостоверяющего регистрацию лица в качестве резидента особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) или свидетельства о включении в единый реестр участников свободной экономической зоны)
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td/>
								</tr>
							</xsl:if>
							<tr align="left">
								<td rowspan="2">
									<xsl:text>Транспортное средство: </xsl:text>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="exnot:TransportMeans"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:choose>
														<xsl:when test="exnot:ZoneKind = 1 or exnot:ZoneKind = 3 or exnot:ZoneKind = 4">
															("а/м" - если перевозка осуществляется автомобильным видом транспорта, "ж/д" - если перевозка осуществляется железнодорожным видом транспорта, "в/т" - если перевозка осуществляется морским (речным) транспортом, "спецтехника" - если на территории участка резидента въезжает самоходная строительная техника), а так же марка и модель транспортного средства, тип подвижного железнодорожного состоава; "ручная кладь" с указанием сведений о физическом лице, которым будет осуществлен вывоз товаров с территории ОЭЗ (фамилия, имя, отчество (при наличии) и данные документа, удостоверяющего личность физического лица (серия (если имеется), номер, дата выдачи)
														</xsl:when>
														<xsl:when test="exnot:ZoneKind = 2">
															(типа, марка, наименование)
														</xsl:when>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="exnot:ZoneKind = 1">Номер транспортного средства или договор перевозки груза (если перевозка осуществляется водным или железнодорожным транспортом и у резидента отсутствуют транспортные (перевозочные) документы на момент подачи уведомления):</xsl:when>
										<xsl:otherwise>Регистрационный номер транспортного средства:</xsl:otherwise>
									</xsl:choose>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="exnot:TransportMeans" mode="transport_numbers"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:choose>
														<xsl:when test="exnot:ZoneKind = 1">
															(государственный регистрационный номер транспортного средства, номер железнодорожного вагона, идентификационный номер контейнера, наименование водного судна, регистрационный номер самоходной строительной техники)
														</xsl:when>
														<xsl:when test="exnot:ZoneKind = 2">
															(государственный регистрациоонный номер, номер вагона (контейнера), номер рейса (при наличии)
														</xsl:when>
														<xsl:when test="exnot:ZoneKind = 3 or exnot:ZoneKind = 4">(регистрационный номер автотранспортного средства, номер железнодорожного вагона), контейнера, напименование водного судна, регистрационный номер самоходной строительной техники)</xsl:when>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr align="left">
								<td>
									<xsl:text>Вес транспортного средства: </xsl:text>
									<xsl:apply-templates select="exnot:TransportMeans/exnot:TareWeight"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<br/>
									<br/>
									<xsl:text>Таблица "Сведения о вывозимых товарах"</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="exnot:ZoneKind='1'">
						<table cellpadding="0" cellspacing="0" style="width:100%; border: 1px solid black; font-size: 9pt;">
							<tbody>
								<tr align="center" valign="top">
									<td rowspan="3" class="tdBorder" width="1%" style="word-break: break-all;">№ п/п</td>
									<td rowspan="3" class="tdBorder" width="15%" style="word-break: break-all;">Наименование товара</td>
									<td rowspan="3" class="tdBorder" width="8%" style="word-break: break-all;">Идентификационные признаки товара (сорт, марка, модель, артикул и (или) отличительные технические или количественные характеристики</td>
									<td rowspan="3" class="tdBorder" width="8%" style="word-break: break-all;">Кол-во грузовых мест</td>
									<td rowspan="3" class="tdBorder" width="8%" style="word-break: break-all;">Общая масса товара вместе с тарой и упаковкой, кг</td>
									<td rowspan="3" class="tdBorder" width="8%" style="word-break: break-all;">Вид упаковки в соответствии с классификатором</td>
									<td colspan="4" class="tdBorder" width="23%" style="word-break: break-all;">Сведения о статусе товара</td>
								</tr>
								<tr align="center" valign="top">
									<td rowspan="2" class="tdBorder" width="6%" style="word-break: break-all;">"ЕАЭС"; "ТРАНЗИТ"; "СТЗ"; "ИНТ"</td>
									<td colspan="2" class="tdBorder" width="15%" style="word-break: break-all;">Сведения, подтверждающие статус товаров</td>
									<td rowspan="2" class="tdBorder" width="6%" style="word-break: break-all;">масса "нетто"/ кг/ кол-во в ДЕИ/ наименование/ код ДЕИ</td>
								</tr>
								<tr align="center" valign="top">
									<td class="tdBorder" width="7%" style="word-break: break-all;">код таможенной процедуры</td>
									<td class="tdBorder" width="8%" style="word-break: break-all;">реквизиты документов, подтверждающих основания для вывоза товаров</td>
								</tr>
								<tr align="center">
									<td class="tdBorder">1</td>
									<td class="tdBorder">2</td>
									<td class="tdBorder">3</td>
									<td class="tdBorder">4</td>
									<td class="tdBorder">5</td>
									<td class="tdBorder">6</td>
									<td class="tdBorder">7</td>
									<td class="tdBorder">8</td>
									<td class="tdBorder">9</td>
									<td class="tdBorder">10</td>
								</tr>
								<xsl:variable name="docSign" select="exnot:ZoneKind"/>
								<xsl:for-each select="exnot:GoodsInfo">
									<xsl:variable name="pos" select="position()"/>
									<tr valign="top" style="word-break:break-all;">
										<td class="tdBorder">
											<xsl:number value="position()"/>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:apply-templates select="exnot:GoodsDescription"/>
										</td>
										<td class="tdBorder">
											<xsl:apply-templates select="exnot:GoodsIdentification"/>
											<br/>
											<xsl:for-each select="*[local-name() = 'GoodTrademark' or local-name() = 'GoodMarking' or local-name() = 'GoodsMark' or local-name() = 'GoodsModel' or local-name() = 'GoodsStandard' or local-name() = 'GoodsSort']">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:PackagesQuantity"/> 
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:GrossWeightQuantity"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:apply-templates select="exnot:PackagingKind"/> 
										</td>
										<td class="tdBorder" align="center">
													<xsl:apply-templates select="exnot:GoodsStatus/exnot:StatusSymbolicValue" mode="status"/>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:GoodsStatus//exnot:CustomsModeCode">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:for-each select="exnot:GoodsStatus/*[starts-with(local-name(), 'GoodsStatus')]">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:for-each select="/exnot:DTInfo/exnot:GTDID">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:CustomsCode"/>
												<xsl:text>/ </xsl:text>
												<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_dt"/>
												<xsl:text>/ </xsl:text>
												<xsl:apply-templates select="cat_ru:GTDNumber"/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:apply-templates select="exnot:NetWeightQuantity"/>
											<xsl:if test="exnot:NetWeightQuantity">/</xsl:if>
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<xsl:if test="position() != 1"><xsl:text>/</xsl:text></xsl:if>
												<xsl:for-each select="*">
													<xsl:if test="position() != 1">/</xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>												
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table style="width:297mm">
							<tbody>
								<tr>
									<td align="left">
										<br/>Таблица "Опись документов"<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table width="70%">
											<tbody>
												<tr>
													<td class="tdBorder" width="10%">№ п/п</td>
													<td class="tdBorder" width="50%">Наименование документов</td>
													<td class="tdBorder" width="40%">Реквизиты (номер, дата) документа</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">1</td>
													<td class="tdBorder">2</td>
													<td class="tdBorder">3</td>
												</tr>
												<xsl:for-each select="exnot:DocList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td class="tdBorder">
															<xsl:number value="position()"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														</td>
														<td class="tdBorder" align="center">
															№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/><br/>
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
										<xsl:for-each select="exnot:PersonSignature">
											<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
											<br/>
											<xsl:for-each select="*[contains(local-name(), 'ame')]">
												<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:if test="*[local-name() = 'AuthorityDoc']">
												<br/>
												<xsl:apply-templates select="*[local-name() = 'AuthorityDoc']" mode="doc"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="exnot:ApplicantSign">
										<br/>
										<xsl:apply-templates select="exnot:TrustedOrganization"/>
										</xsl:if>
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td style="width:100mm; border-bottom: 1pt solid windowtext;">
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" style="width:137mm" class="graphLittle">
										(лицо, уполномоченное резидентом особой экономической зоны, на подачу уведомления (должнось, фамилия, имя отчество (при наличии), а также полное наименование организации, содержащее указание на ее организационно-правовую форму, ОГРН, ИНН, место нахождения юридического лица и адрес в пределах местонахождения юридического лица, если лицо подающее уведомление о вывозе товаров не является резидентом)
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td align="center" style="width:100mm" class="graphLittle">
										(подпись)
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="exnot:ZoneKind='2'">
						<table cellpadding="0" cellspacing="0" style="width:100%; border: 1px solid black; font-size: 9pt;">
							<tbody>
								<tr align="center" valign="top">
									<td class="tdBorder" width="4%">№ п/п</td>
									<td class="tdBorder" width="20%">Наименование товара</td>
									<td class="tdBorder" width="8%">Кол-во товаров</td>
									<td class="tdBorder" width="8%">Единица измерения/ код единицы измерения в соответствии с ТН ВЭД</td>
									<td class="tdBorder" width="8%">Кол-во грузовых мест</td>
									<td class="tdBorder" width="8%">Масса товара (нетто/кг)</td>
									<td class="tdBorder" width="8%">Вид упаковки</td>
									<td class="tdBorder" width="10%">Статус товара для таможенных целей</td>
									<td class="tdBorder" width="26%">Примечание</td>
								</tr>
								<tr align="center">
									<td class="tdBorder">1</td>
									<td class="tdBorder">2</td>
									<td class="tdBorder">3</td>
									<td class="tdBorder">4</td>
									<td class="tdBorder">5</td>
									<td class="tdBorder">6</td>
									<td class="tdBorder">7</td>
									<td class="tdBorder">8</td>
									<td class="tdBorder">9</td>
								</tr>
								<xsl:variable name="docSign" select="exnot:ZoneKind"/>
								<xsl:for-each select="exnot:GoodsInfo">
									<xsl:variable name="pos" select="position()"/>
									<tr valign="top" style="word-break: break-all;">
										<td class="tdBorder">
											<xsl:number value="position()"/>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:GoodsDescription">
												<xsl:apply-templates select="."/> 
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:PackagesQuantity"/> 
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:NetWeightQuantity"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:apply-templates select="exnot:PackagingKind"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:for-each select="exnot:GoodsStatus">
												<xsl:choose>
													<!--xsl:when test="$docSign != '0'"-->
													<xsl:when test="not(*[contains(local-name(), 'GoodsStatus')]/exnot:DTGoods)">
														<xsl:apply-templates select="exnot:StatusSymbolicValue" mode="status"/>
														<xsl:if test="exnot:CustomsModeCode">
															<xsl:text>/</xsl:text>
															<xsl:apply-templates select="exnot:CustomsModeCode"/>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select=".//exnot:DTInfo/exnot:DTGoods">
															<xsl:if test="position() != 1"><br/><br/></xsl:if>
															<xsl:apply-templates select="../../exnot:StatusSymbolicValue" mode="status"/>
															<xsl:if test="../../exnot:CustomsModeCode">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../../exnot:CustomsModeCode"/>
															</xsl:if>
															<xsl:if test="../exnot:GTDID">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:CustomsCode"/>
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:RegistrationDate" mode="russian_date_dt"/>
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:GTDNumber"/>
															</xsl:if>
															<xsl:if test="exnot:GoodsNumeric">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="exnot:GoodsNumeric"/>
															</xsl:if>
															<xsl:choose>
																<xsl:when test="exnot:SupplementaryQuantity">
																	<xsl:for-each select="exnot:SupplementaryQuantity">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																		<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:if test="exnot:NetWeightQuantity">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="exnot:NetWeightQuantity"/>
																		<xsl:text> кг</xsl:text>
																	</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:Note">
												<xsl:apply-templates select="."/> 
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table style="width:297mm">
							<tbody>
								<tr>
									<td align="left">
										<br/>
										<xsl:text>Предполагаемый срок вывоза товара и выезда транспортного средства: </xsl:text>
										<xsl:if test="exnot:ProvisionalDateBegin">
											<xsl:text> с </xsl:text>
											<xsl:apply-templates select="exnot:ProvisionalDateBegin" mode="russian_date"/>
										</xsl:if>
										<xsl:if test="exnot:ProvisionalDateEnd">
											<xsl:text> по </xsl:text>
											<xsl:apply-templates select="exnot:ProvisionalDateEnd" mode="russian_date"/>
										</xsl:if>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<br/>Таблица "Опись документов"<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table width="70%">
											<tbody>
												<tr>
													<td class="tdBorder" width="10%">№ п/п</td>
													<td class="tdBorder" width="50%">Наименование документов</td>
													<td class="tdBorder" width="40%">Реквизиты (номер, дата) документа</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">1</td>
													<td class="tdBorder">2</td>
													<td class="tdBorder">3</td>
												</tr>
												<xsl:for-each select="exnot:DocList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td class="tdBorder">
															<xsl:number value="position()"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														</td>
														<td class="tdBorder" align="center">
															№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/><br/>
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
										<xsl:for-each select="exnot:PersonSignature">
											<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
											<br/>
											<xsl:for-each select="*[contains(local-name(), 'ame')]">
												<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:if test="*[local-name() = 'AuthorityDoc']">
												<br/>
												<xsl:apply-templates select="*[local-name() = 'AuthorityDoc']" mode="doc"/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td style="width:100mm; border-bottom: 1pt solid windowtext;">
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" style="width:137mm" class="graphLittle">
										(должность, инициалы и фамилия лица, уполномоченного резидентом, участником или декларантом
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td align="center" style="width:100mm" class="graphLittle">
										(подпись)
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="exnot:ZoneKind='3' or exnot:ZoneKind='4'">
						<table cellpadding="0" cellspacing="0" style="width:100%; border: 1px solid black; font-size: 9pt;">
							<tbody>
								<tr align="center" valign="top">
									<td rowspan="3" class="tdBorder" width="1%" style="word-break: break-all;">№ п/п</td>
									<td rowspan="3" class="tdBorder" width="15%" style="word-break: break-all;">Наименование товара</td>
									<td rowspan="3" class="tdBorder" width="8%" style="word-break: break-all;">Кол-во товара/ единица измерения количества</td>
									<td rowspan="3" class="tdBorder" width="2%" style="word-break: break-all;">Кол-во грузовых мест</td>
									<td rowspan="3" class="tdBorder" width="3%" style="word-break: break-all;">Общая масса товара вместе с тарой и упаковкой, кг</td>
									<td rowspan="3" class="tdBorder" width="5%" style="word-break: break-all;">Вид упаковки в соответствии с классификатором</td>
									<td colspan="4" class="tdBorder" width="36%" style="word-break: break-all;">Сведения о статусе товара</td>
								</tr>
								<tr align="center" valign="top">
									<td rowspan="2" class="tdBorder" width="6%" style="word-break: break-all;">"ЕАЭС"; "ТРАНЗИТ"; "СТЗ"; "ИНТ"</td>
									<td colspan="2" class="tdBorder" width="29%" style="word-break: break-all;">Сведения, подтверждающие статус товаров</td>
									<td rowspan="2" class="tdBorder" width="6%" style="word-break: break-all;">масса "нетто"/ кг/ кол-во в ДЕИ/ наименование/ код ДЕИ</td>
								</tr>
								<tr align="center" valign="top">
									<td class="tdBorder" width="7%" style="word-break: break-all;">код таможенной процедуры</td>
									<td class="tdBorder" width="22%" style="word-break: break-all;">реквизиты документов, подтверждающих основания для вывоза товаров</td>
								</tr>
								<tr align="center">
									<td class="tdBorder">1</td>
									<td class="tdBorder">2</td>
									<td class="tdBorder">3</td>
									<td class="tdBorder">4</td>
									<td class="tdBorder">5</td>
									<td class="tdBorder">6</td>
									<td class="tdBorder">7</td>
									<td class="tdBorder">8</td>
									<td class="tdBorder">9</td>
									<td class="tdBorder">10</td>
								</tr>
								<xsl:variable name="docSign" select="exnot:ZoneKind"/>
								<xsl:for-each select="exnot:GoodsInfo">
									<xsl:variable name="pos" select="position()"/>
									<tr valign="top" style="word-break: break-all;">
										<td class="tdBorder">
											<xsl:number value="position()"/>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:apply-templates select="exnot:GoodsDescription"/>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:PackagesQuantity"/> 
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:GrossWeightQuantity"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:apply-templates select="exnot:PackagingKind"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:apply-templates select="exnot:GoodsStatus/exnot:StatusSymbolicValue" mode="status"/>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:GoodsStatus//exnot:CustomsModeCode">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:for-each select="exnot:GoodsStatus/*[contains(local-name(), 'GoodsStatus')]">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:apply-templates select="exnot:NetWeightQuantity"/>
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<br/>
												<xsl:for-each select="*">
													<xsl:if test="position() != 1">/</xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>												
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table style="width:297mm">
							<tbody>
								<tr>
									<td align="left">
										<br/>Таблица "Опись документов"<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table width="70%">
											<tbody>
												<tr>
													<td class="tdBorder" width="10%">№ п/п</td>
													<td class="tdBorder" width="50%">Наименование документов</td>
													<td class="tdBorder" width="40%">Реквизиты (номер, дата) документа</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">1</td>
													<td class="tdBorder">2</td>
													<td class="tdBorder">3</td>
												</tr>
												<xsl:for-each select="exnot:DocList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td class="tdBorder">
															<xsl:number value="position()"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														</td>
														<td class="tdBorder" align="center">
															№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/><br/>
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
										<xsl:for-each select="exnot:PersonSignature">
											<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
											<br/>
											<xsl:for-each select="*[contains(local-name(), 'ame')]">
												<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:if test="*[local-name() = 'AuthorityDoc']">
												<br/>
												<xsl:apply-templates select="*[local-name() = 'AuthorityDoc']" mode="doc"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="exnot:ApplicantSign">
										<br/>
										<xsl:apply-templates select="exnot:TrustedOrganization"/>
										</xsl:if>
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td style="width:100mm; border-bottom: 1pt solid windowtext;">
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" style="width:137mm" class="graphLittle">
										(лицо, подающее уведомление (резидент или лицо, уполномоченное резидентом на подачу уведомления (должность, инициалы и фамилия физического лица, полное наименование юридического лица, ОГРН, ИНН, адрес в пределах места нахождения юридического лица)
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td align="center" style="width:100mm" class="graphLittle">
										(подпись)
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
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
	</xsl:template>
	
	<xsl:template match="*" mode="status">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">ЕАЭС</xsl:when>
				<xsl:when test=". = 2">ИНТ</xsl:when>
				<xsl:when test=". = 3">СТЗ</xsl:when>
				<xsl:when test=". = 4">ТРАНЗИТ</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<!-- типы документов -->
	<xsl:template match="*[local-name() = 'GoodsStatus1']">
		<xsl:for-each select="*[local-name() = 'DTInfo']/*[local-name() = 'GTDID']">
			<br/>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus2']">
		<xsl:for-each select="*[local-name() = 'DTInfo']/*[local-name() = 'GTDID']">
			<br/>
			<xsl:apply-templates select="."/>
			<xsl:if test="*[local-name() = 'GoodsNumber']">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="*[local-name() = 'GoodsNumber']"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus3']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus4']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus5']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus6']">
		<xsl:for-each select="*[local-name() = 'PermitRegistrationNumber']">
			<br/>
			<xsl:apply-templates select="." mode="reg_num"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'ConclusionIdentifi']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'ConclusionIdentifi']" mode="reg_num"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'WasteManagementServDoc']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'WasteManagementServDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus7']">
		<xsl:for-each select="*[local-name() = 'DTInfo']/*[local-name() = 'GTDID']">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="."/>
			<xsl:for-each select="../*[local-name() = 'DTGoods']/*[local-name() = 'GoodsNumeric']">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus8']">
		<xsl:for-each select="*[contains(local-name(), 'WH')]">
			<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
			<xsl:apply-templates select="." mode="doc"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'TerritoryAddress']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'TerritoryAddress']" mode="address"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus9']">
		<xsl:for-each select="*[local-name() = 'PermissionTakeSamples']">
			<br/>
			<xsl:apply-templates select="." mode="doc"/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'AccountingDocumentInfo']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AccountingDocumentInfo']/*[local-name() = 'AccountingDoc']" mode="doc"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'GoodsStatus10']">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="*[local-name() = 'GTDID']">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_dt"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
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
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
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
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
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
	
	<xsl:template match="exnot:TransportMeans" mode="transport_numbers">
		<xsl:if test="exnot:ContainerNumber">
			<xsl:text> Контейнеры: </xsl:text>
			<xsl:for-each select="exnot:ContainerNumber">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="exnot:ActiveTransportIdentifier">
			<xsl:text> Рег.номер ТС: </xsl:text><xsl:apply-templates select="exnot:ActiveTransportIdentifier"/>
		</xsl:if>
		<xsl:if test="exnot:TransportRegNumber or exnot:EmptyTransportRegNumber">
			<xsl:text> Прицеп: </xsl:text>
			<xsl:for-each select="*[local-name() = 'TransportRegNumber' or local-name() = 'EmptyTransportRegNumber']">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="exnot:FlightNumber">
			<xsl:text> Рейс: </xsl:text><xsl:apply-templates select="exnot:FlightNumber"/>
		</xsl:if>
		<xsl:if test="exnot:FlightDate">
			<xsl:text> Дата рейса: </xsl:text><xsl:apply-templates select="exnot:FlightDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="exnot:TransportMeans">
		<xsl:apply-templates select="exnot:TransportMode"/>
		<xsl:if test="exnot:TransportMark">
			<xsl:text>, Марка: </xsl:text>
			<xsl:apply-templates select="exnot:TransportMark"/>
		</xsl:if>
		<xsl:if test="exnot:TransportModel">
			<xsl:text>, Модель: </xsl:text>
			<xsl:apply-templates select="exnot:TransportModel"/>
		</xsl:if>
		<xsl:if test="exnot:TrainType">
			<xsl:text>, Тип подвижного ж/д состава: </xsl:text>
			<xsl:apply-templates select="exnot:TrainType"/>
		</xsl:if>
		<xsl:if test="exnot:PersonDetails">
			<xsl:text>, ФИО: </xsl:text>
			<xsl:for-each select="exnot:PersonDetails/*[contains(local-name(), 'ame')]">
				<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="exnot:PersonID">
			<xsl:text>, Документ, удостоверяющий личность: </xsl:text>
			<xsl:apply-templates select="exnot:PersonID" mode="personID"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*[local-name() = 'TransportMode']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">а/м</xsl:when>
				<xsl:when test=". = 2">ж/д</xsl:when>
				<xsl:when test=". = 3">авиа</xsl:when>
				<xsl:when test=". = 4">в/т</xsl:when>
				<xsl:when test=". = 5">спецтехника</xsl:when>
				<xsl:when test=". = 6">ручная кладь (багаж)</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="personID">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="exnot:Consignee|exnot:Resident|exnot:TrustedOrganization">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text>, </xsl:text>
		<xsl:for-each select="exnot:Address">
			<xsl:if test="position() != 1">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="exnot:CertificateNumber">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="exnot:CertificateNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="exnot:CertificateNumber">
		<xsl:text> Свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template name="NotifNumber">
		<xsl:choose>
			<xsl:when test="$OEZ_NotifReg">
				<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="exnot:RegistrationNumber" mode="reg_num"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="exnot:Address | RUScat_ru:SubjectAddressDetails | exnot:AddressZone">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<!--xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if-->
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
						<!--xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when-->
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
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
   </xsl:template>
	<xsl:template match="*" mode="reg_num">
	   <xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'Number']"/>
	   <xsl:if test="exnot:AddNumber|oeznr:DocKind">
		   <xsl:text>/</xsl:text>
		   <xsl:apply-templates select="exnot:AddNumber|oeznr:DocKind"/>
	   </xsl:if>
   </xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/> 
		</xsl:if>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:value-of select="substring($dateIn2,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_dt">
		<xsl:param name="dateIn3"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
				<xsl:value-of select="substring($dateIn3,9,2)"/>
				<xsl:value-of select="substring($dateIn3,6,2)"/>
				<xsl:value-of select="substring($dateIn3,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn3"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:apply-templates select="cat_ru:Region"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:apply-templates select="cat_ru:City"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
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
