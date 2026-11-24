<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:notif_RegFW="urn:customs.ru:Information:RegistrationDocuments:NotifFreeWarehousesRegistry:5.24.0">
<!--Уведомление о внесении изменений в Реестр владельцев свободных складов (notif_RegFW:NotificationType = ВИЗ);
Уведомление об отказе внесения изменений в Реестр владельцев свободных складов (notif_RegFW:NotificationType = ОИЗ);
Уведомление об исключении из Реестра владельцев свободных складов по желанию лица (notif_RegFW:NotificationType = ВИС);
Уведомление об отказе в исключении из Реестра владельцев свободных складов по желанию лица (notif_RegFW:NotificationType = ОИС)-->
	<!-- Шаблон для типа NotifFreeWarehousesRegistryType -->
	<xsl:template match="notif_RegFW:NotifFreeWarehousesRegistry">
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
									<xsl:if test="notif_RegFW:NotificationType='ВИЗ'">
										<xsl:text>Уведомление о внесении изменений в Реестр владельцев свободных складов</xsl:text>
									</xsl:if>
									<xsl:if test="notif_RegFW:NotificationType='ОИЗ'">
										<xsl:text>Уведомление об отказе во внесении изменений в Реестр владельцев свободных складов</xsl:text>
									</xsl:if>
									<xsl:if test="notif_RegFW:NotificationType='ВИС'">
										<xsl:text>Уведомление об исключении из Реестра владельцев свободных складов по желанию лица</xsl:text>
									</xsl:if>
									<xsl:if test="notif_RegFW:NotificationType='ОИС'">
										<xsl:text>Уведомление об отказе в исключении из Реестра владельцев свободных складов по желанию лица</xsl:text>
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
											<xsl:apply-templates select="notif_RegFW:RegistrationNumber"/>
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
							<xsl:if test="notif_RegFW:NotificationType='ВИЗ'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text>На основании Заявления о внесении изменений в Реестр владельцев свободных складов </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_RegFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(полное и сокращенное (при наличии) наименование организации, организационно-правовая форма, ИНН и номер свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> было принято решение о внесении изменений в Реестр владельцев свободных складов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Сведения о внесении изменений в Реестр:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_RegFW:ChangeDetails"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notif_RegFW:NotificationType='ОИЗ'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text>На основании Заявления о внесении изменений в Реестр владельцев свободных складов </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_RegFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(полное и сокращенное (при наличии) наименование организации, организационно-правовая форма, ИНН и номер свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> было принято решение об отказе во внесении изменений в Реестр владельцев свободных складов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Причины отказа внесения изменений в Реестр:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_RegFW:RefChangeReasons"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notif_RegFW:NotificationType='ВИС'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text>На основании Заявления об исключении из Реестра владельцев свободных складов </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_RegFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(полное и сокращенное (при наличии) наименование организации, организационно-правовая форма, ИНН и номер свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> было принято решение об исключении из Реестра владельцев свободных складов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Сведения об исключении лица из Реестра:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_RegFW:Exception/notif_RegFW:ExceptionDetails"/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Действия, которые необходимо совершить лицу в отношении товаров:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_RegFW:Exception/notif_RegFW:Actions"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notif_RegFW:NotificationType='ОИС'">
								<tr>
									<td style="text-align: justify;">
										<xsl:text>На основании Заявления об исключении из Реестра владельцев свободных складов </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="notif_RegFW:AppOrganizationInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(полное и сокращенное (при наличии) наименование организации, организационно-правовая форма, ИНН и номер свидетельства ВСС)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text> было принято решение об отказе в исключении из Реестра владельцев свободных складов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Причины отказа в исключении лица из Реестра:</xsl:text>
										<br/>
										<xsl:apply-templates select="notif_RegFW:RefExceptionReasons"/>
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
								<td colspan="3">
									<xsl:text>Руководитель структурного подразделения ФТС России</xsl:text>
								</td>
							</tr>
							<tr>
								<td width="55%">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="notif_RegFW:CustomsPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
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

	<!-- Шаблон для типа notif_RegFW:RegistrationNumber -->
	<xsl:template match="notif_RegFW:RegistrationNumber">
		<xsl:value-of select="notif_RegFW:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="notif_RegFW:Date"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="notif_RegFW:SerialNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="notif_RegFW:DocumentType"/>
	</xsl:template>

	<!-- Шаблон для типа notif_RegFW:AppOrganizationInfo -->
	<xsl:template match="notif_RegFW:AppOrganizationInfo">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:text>; ОПФ - </xsl:text>
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		<xsl:text>; ИНН - </xsl:text>
		<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		<xsl:text> (свидетельство ВСС №</xsl:text>
		<xsl:value-of select="notif_RegFW:FreeWHOwnersRegistryCertificate/notif_RegFW:CertificateNumber"/>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<!-- Шаблон для типа notif_RegFW:CustomsPerson -->
	<xsl:template match="notif_RegFW:CustomsPerson">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>