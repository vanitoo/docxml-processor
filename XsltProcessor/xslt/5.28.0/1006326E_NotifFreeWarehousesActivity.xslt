<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:notif_ActFW="urn:customs.ru:Information:RegistrationDocuments:NotifFreeWarehousesActivity:5.24.0">
<!--Уведомление юридического лица уполномоченным таможенным органом о приостановлении деятельности в качестве владельца свободного склада (notif_ActFW:NotificationType = УПД);
Уведомление о возобновлении деятельности юридического лица в качестве владельца свободного склада (notif_ActFW:NotificationType = УВД);
Уведомление об отказе возобновления деятельности юридического лица в качестве владельца свободного склада и начале процедуры исключения юридического лица из Реестра владельцев свободных складов в связи с не устранением выявленных таможенным органом нарушений (notif_ActFW:NotificationType = ОВД)-->
	<!-- Шаблон для типа NotifFreeWarehousesActivityType -->
	<xsl:template match="notif_ActFW:NotifFreeWarehousesActivity">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: nowrap;}

					div.page
					{width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					page-break-after: always;
					font-family: Arial;
					font-size: 11pt;}

					.marg-top
					{margin-top: 5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-family: Arial;
					font-size: 11pt;}

					table.border tr td
					{border: 1px solid windowtext;}

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

					.graph
					{font-family: Arial;
					font-size: 11pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align: bottom;}

					div.title, tr.title td
					{font-weight: bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					.border_bottom
					{border-bottom: 1px solid black;}

					.graphMain
					{font-family: Arial;
					font-size: 11pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;
					vertical-align: top;}

					td.graphMain
					{vertical-align: top;}

					.graphHeader
					{font-family: Arial;
					font-size: 11pt;
					font-weight: bold;}

					td.graphHeader
					{vertical-align: top;}

					.normal
					{font-size: 11pt;
					font-family: Arial;}

					.bold
					{font-weight: bold;
					font-family: Arial;
					font-size: 9pt;}

					.italic
					{font-style: italic;
					font-family: Arial;
					font-size: 11pt;}

					.descr
					{font-size: 7.5pt;
					text-align: center;}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>
									<xsl:if test="notif_ActFW:NotificationType='УПД'">
										<xsl:text>Уведомление юридического лица уполномоченным таможенным органом о приостановлении деятельности в качестве владельца свободного склада</xsl:text>
									</xsl:if>
									<xsl:if test="notif_ActFW:NotificationType='УВД'">
										<xsl:text>Уведомление о возобновлении деятельности юридического лица в качестве владельца свободного склада</xsl:text>
									</xsl:if>
									<xsl:if test="notif_ActFW:NotificationType='ОВД'">
										<xsl:text>Уведомление об отказе возобновления деятельности юридического лица в качестве владельца свободного склада и начале процедуры исключения юридического лица из Реестра владельцев свободных складов в связи с не устранением выявленных таможенным органом нарушений</xsl:text>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr align="center">
								<td>
									<xsl:text>регистрационный № </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="notif_ActFW:RegistrationNumber"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'70mm'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td style="text-align: justify;">
									<xsl:text>Информируем, что таможенным органом </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="notif_ActFW:Customs"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(указывается код и наименование таможенного органа)'"/>
										<xsl:with-param name="width" select="'84mm'"/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="notif_ActFW:NotificationType='УПД'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text> выявлено несоблюдение владельцем свободного склада </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_ActFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование организации и № свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> условий включения в реестр владельцев свободных складов, предусмотренных пунктами 3 и 4 части 3 статьи 369 Федерального закона от 03.08.2018 № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» </xsl:text>
										<xsl:for-each select="notif_ActFW:Suspension">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="notif_ActFW:SuspensionReasons"/>
													<xsl:text> (необходимые действия - </xsl:text>
													<xsl:value-of select="notif_ActFW:Actions"/>
													<xsl:text>)</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="descr" align="center">
										<xsl:text>указываются выявленные основания для приостановления деятельности юридического лица в качестве ВСС</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text> в связи с чем деятельность </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="notif_ActFW:AppOrganizationInfo/cat_ru:OrganizationName"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'50mm'"/>
										</xsl:call-template>
										&#160;
										<xsl:text> в качестве владельца свободного склада приостановлена.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notif_ActFW:NotificationType='УВД'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text> принято решение о возобновлении деятельности </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_ActFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование организации и № свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> в качестве владельца свободного склада.</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Сведения о возобновлении деятельности владельца свободного склада:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_ActFW:ResumptionDetails"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notif_ActFW:NotificationType='ОВД'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text> принято решение об отказе в возобновлении деятельности </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_ActFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование организации и № свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> в качестве владельца свободного склада и начале процедуры исключения из Реестра владельцев свободных складов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Причины отказа в возобновлении деятельности владельца свободного склада и начале процедуры исключения его из Реестра владельцев свободных складов:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_ActFW:RefResumptionReasons"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table>
						<tbody class="graphMain">
							<tr>
								<td>
									<xsl:text>Начальник таможенного органа</xsl:text>
								</td>
							</tr>
							<tr>
								<td width="55%">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="notif_ActFW:CustomsPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии))'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
								<td width="15%"> </td>
								<td width="30%">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(подпись)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Шаблон для типа notif_ActFW:RegistrationNumber -->
	<xsl:template match="notif_ActFW:RegistrationNumber">
		<xsl:value-of select="notif_ActFW:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="notif_ActFW:Date"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="notif_ActFW:SerialNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="notif_ActFW:DocumentType"/>
	</xsl:template>

	<!-- Шаблон для типа notif_ActFW:Customs -->
	<xsl:template match="notif_ActFW:Customs">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:OfficeName"/>
	</xsl:template>

	<!-- Шаблон для типа notif_ActFW:AppOrganizationInfo -->
	<xsl:template match="notif_ActFW:AppOrganizationInfo">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:text> (свидетельство ВСС №</xsl:text>
		<xsl:value-of select="notif_ActFW:FreeWHOwnersRegistryCertificate/notif_ActFW:CertificateNumber"/>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<!-- Шаблон для типа notif_ActFW:CustomsPerson -->
	<xsl:template match="notif_ActFW:CustomsPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>