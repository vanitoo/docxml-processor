<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:tci="urn:customs.ru:Information:CustomsDocuments:TransitInfo:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
		<xsl:param name="dategtd"/>
		<xsl:choose>
			<xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
				<xsl:value-of select="substring($dategtd,9,2)"/>
				<xsl:value-of select="substring($dategtd,6,2)"/>
				<xsl:value-of select="substring($dategtd,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dategtd"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
    -->
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="tci:TransitInfo">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Информация о транзитных товарах</title>
				<style type="text/css">
					body
					{text-align: center;
					background: #cccccc;}

					div.page
					{width: 260mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;}

					td
					{font-family:Courier;}

					.normal
					{font-weight: bold;
					font-family:Arial;
					font-size: 10pt;
					border-left: medium none;
					border-right: medium none;
					border-top: medium none;
					border-bottom: 1pt solid windowtext;}

					h2
					{text-align:center;
					font: 20 ;
					font-family: Arial, serif;}

					.bold
					{font-weight: bold;
					font-family:Arial;
					font-size: 15pt;}

					.italic
					{font-style: italic; 
					font-family:Arial;
					font-size: 9pt}

					.graph
					{font-family: Arial;
					font-size: 10pt;
					font-weight: normal;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;
					font-weight: normal;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;
					font-weight: normal;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					.graph8Bold
					{font-family: Arial;
					font-size: 8pt;
					font-weight: bold;}

					.bordered
					{border-bottom: solid 1pt #000000;
					font-weight: bold;}

					.borderedAll
					{border-bottom: solid 1pt #000000;
					border-top: solid 1pt #000000;
					border-left: solid 1pt #000000;
					border-right: solid 1pt #000000;
					font-weight: bold;}
					
					.borderNormal{
						border: 1px solid black;
					}
                </style>
			</head>
			<body>
				<div class="page">
					<h2>Информация о транзитных товарах</h2>
					<table border="0" style="width:210mm">
						<tbody>
							<tr>
								<td align="left" class="graph" style="width:100mm">Прикладное статусное состояние транзитной перевозки</td>
								<td align="left" class="graph" style="width:100mm">
									<xsl:choose>
										<xsl:when test="tci:StatusName='TD_ANNULLED'">ТД аннулирована</xsl:when>
										<xsl:when test="tci:StatusName='TD_REGISTERED'">ТД зарегистрирована</xsl:when>
										<xsl:when test="tci:StatusName='TD_REGISTRATION_DENIED'">Отказ в регистрации</xsl:when>
										<xsl:when test="tci:StatusName='TD_REG_RSKCHCK'">Проверен на риски при регистрации ТД</xsl:when>
										<xsl:when test="tci:StatusName='TD_REVOKED'">ТД отозвана</xsl:when>
										<xsl:when test="tci:StatusName='TEMPOR_ANNULATED'">ВВ/обратный ввоз-вывоз аннулирован</xsl:when>
										<xsl:when test="tci:StatusName='TEMPOR_ANNULATE_START'">Отмена операции создана</xsl:when>
										<xsl:when test="tci:StatusName='TRNCLOSE'">Закрыт транзит</xsl:when>
										<xsl:when test="tci:StatusName='TRNOPEN'">Открыт транзит</xsl:when>
										<xsl:when test="tci:StatusName='TR_ALLOWED'">Товары выпущены</xsl:when>
										<xsl:when test="tci:StatusName='TR_ALL_RSKCHCK'">Выявлены риски при выпуске товаров</xsl:when>
										<xsl:when test="tci:StatusName='TR_ARRIVE_DEST_INFO'">Уведомление о поступлении товара в пункт назначения</xsl:when>
										<xsl:when test="tci:StatusName='TR_ARRIVE_REG'">Зарегистрировано подтверждение о прибытии</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_REQUALIFIED'">Дело об АП переквалифицировано</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_RULING_BECOME_VALID'">Постановление по делу об АП вступило в силу</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_RULING_CANCELLED'">Постановление по делу об АП отменено</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_RULING_EXECUTED'">Постановление по делу об АП исполнено</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_RULING_IN_APPEAL'">Постановление по делу об АП обжалуется</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_RULING_MADE'">Вынесено постановление по делу об АП</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_STOPPED'">Прекращено дело об АП</xsl:when>
										<xsl:when test="tci:StatusName='TR_AVC_SUED'">Возбуждено дело об АП</xsl:when>
										<xsl:when test="tci:StatusName='TR_CANCELLED'">Транзит отменён</xsl:when>
										<xsl:when test="tci:StatusName='TR_COMPLETED'">Транзит завершён</xsl:when>
										<xsl:when test="tci:StatusName='TR_COMPLETED_W_RESERVATION'">Транзит завершён с оговорками</xsl:when>
										<xsl:when test="tci:StatusName='TR_COMP_RSKCHCK'">Выявлены риски при завершении ТТ</xsl:when>
										<xsl:when test="tci:StatusName='TR_DELIV_RSKCHCK'">Проверен на риски при подтверждении прибытия</xsl:when>
										<xsl:when test="tci:StatusName='TR_ECOP_GOODS_ARRIVED'">Поступление товара УЭО</xsl:when>
										<xsl:when test="tci:StatusName='TR_ECOP_IDENTIF_BAN'">Удаление средств идентификации запрещено</xsl:when>
										<xsl:when test="tci:StatusName='TR_ECOP_IDENTIF_PERMIT'">Разрешено удаление средств идентификации</xsl:when>
										<xsl:when test="tci:StatusName='TR_ECOP_NOTIF_GOODS_ACCEPT'">Товары приняты от перевозчика</xsl:when>
										<xsl:when test="tci:StatusName='TR_ECOP_NOTIF_GOODS_ARRIVE'">Товары доставлены УЭО</xsl:when>
										<xsl:when test="tci:StatusName='TR_GOODS_DELIVERED'">Товары поступили</xsl:when>
										<xsl:when test="tci:StatusName='TR_GOODS_PROVIDED'">Товар предоставлен</xsl:when>
										<xsl:when test="tci:StatusName='TR_GOODS_UNDELIVERED'">Недоставка</xsl:when>
										<xsl:when test="tci:StatusName='TR_ISSUE_DENIED'">Отказ в выпуске</xsl:when>
										<xsl:when test="tci:StatusName='TR_PROVIDE_EXPIRED'">Истекло время предоставления товаров</xsl:when>
										<xsl:when test="tci:StatusName='TR_TERMINATED'">Транзит прекращён</xsl:when>
										<xsl:when test="tci:StatusName='TR_UIN_PROVIDED'">Предоставлен УИН</xsl:when>
										<xsl:when test="tci:StatusName='TR_VED_CONT'">Получено обращение</xsl:when>
										<xsl:when test="tci:StatusName='TR_WAIT_ARRIVE'">Ожидает прибытия</xsl:when>
										<xsl:when test="tci:StatusName='TR_WAIT_PROVIDE'">Ожидание предоставления товаров</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tci:StatusName"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="tci:Reason">
								<tr>
									<td align="left" class="graph" style="width:100mm">Обоснование</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:for-each select="tci:Reason">
											<!--<xsl:if test="position()>1">, </xsl:if>-->
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tci:AddInfoForEndTransit">
								<tr>
									<td align="left" class="graph" style="width:100mm">Дополнительная информация</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:for-each select="tci:AddInfoForEndTransit">
											<!--<xsl:if test="position()>1">, </xsl:if>-->
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="tci:ActNumber">
								<tr>
									<td align="left" class="graph" style="width:100mm">Номер акта таможенного досмотра</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:value-of select="tci:ActNumber"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="left" class="graph" style="width:100mm">Дата и время создания документа</td>
								<td align="left" class="graph" style="width:100mm">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tci:DocumentDateTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(tci:DocumentDateTime, 12, 8)"/>
								</td>
							</tr>
							<xsl:if test="tci:TransitStampDateTime">
								<tr>
									<td align="left" class="graph" style="width:100mm">Дата и время на штампе</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="tci:TransitStampDateTime"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(tci:TransitStampDateTime, 12, 8)"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="left" class="graph" style="width:100mm">Таможенный орган отправления</td>
								<td align="left" class="graph" style="width:100mm">
									<xsl:value-of select="tci:CustomsCode"/>
								</td>
							</tr>
							<xsl:if test="tci:RouteCustomsCode">
								<tr>
									<td align="left" class="graph" style="width:100mm">Код таможенного органа по маршруту</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:for-each select="tci:RouteCustomsCode">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="tci:Header">
								<tr>
									<td align="left" class="graph" style="width:100mm">Тип транзитной декларации</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:value-of select="tci:DeclarationKind"/>
									</td>
								</tr>
								<xsl:if test="tci:TDNumber">
									<tr>
										<td align="left" class="graph" style="width:100mm;">Номер транзитной декларации</td>
										<td align="left" class="graph" style="width:100mm">
											<xsl:value-of select="tci:TDNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dategtd" select="tci:TDNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>/<xsl:value-of select="tci:TDNumber/cat_ru:GTDNumber"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tci:TIRID">
									<tr>
										<td align="left" class="graph" style="width:100mm;">Номер книжки МДП</td>
										<td align="left" class="graph" style="width:100mm">
											<xsl:value-of select="tci:TIRID/tci:TIRSeries"/>
											<xsl:value-of select="tci:TIRID/tci:TIRID"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="tci:TIRID/tci:RegistrationDate"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tci:TransitDateLimit">
									<tr>
										<td align="left" class="graph" style="width:100mm">Срок таможенного транзита</td>
										<td align="left" class="graph" style="width:100mm">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="tci:TransitDateLimit"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="left" class="graph" style="width:100mm">Общее количество товаров</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:value-of select="tci:TotalNumberOfGoods"/>
									</td>
								</tr>
								<tr>
									<td align="left" class="graph" style="width:100mm">Общее количество грузовых мест</td>
									<td align="left" class="graph" style="width:100mm">
										<xsl:value-of select="tci:TotalNumberOfPackages"/>
									</td>
								</tr>
								<xsl:if test="tci:TotalGrossMass">
									<tr>
										<td align="left" class="graph" style="width:100mm">Общий вес брутто</td>
										<td align="left" class="graph" style="width:100mm">
											<xsl:value-of select="tci:TotalGrossMass"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tci:DepartureCountryCode">
									<tr>
										<td align="left" class="graph" style="width:100mm">Код страны отправления</td>
										<td align="left" class="graph" style="width:100mm">
											<xsl:value-of select="tci:DepartureCountryCode"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="tci:DestinationCountryCode">
									<tr>
										<td align="left" class="graph" style="width:100mm">Код страны назначения</td>
										<td align="left" class="graph" style="width:100mm">
											<xsl:value-of select="tci:DestinationCountryCode"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="tci:DeclarantDetails">
								<xsl:for-each select="tci:DeclarantDetails">
									<table width="100%">
										<tr>
											<td align="left" class="graph" style="width:2%"/>
											<td align="left" class="graph" style="width:48%" valign="top">Декларант:</td>
											<td align="left" class="graph" style="width:50%">
												<xsl:apply-templates mode="org" select="."/>
											</td>
										</tr>
										<xsl:if test="RUScat_ru:SubjectBranch">
											<tr>
												<td align="left" class="graph" style="width:4%"/>
												<td align="left" class="graph" style="width:46%" valign="top">Сведения об обособленном подразделении</td>
												<td align="left" class="graph" style="width:50%">
													<xsl:apply-templates mode="org" select="RUScat_ru:SubjectBranch"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="RUDECLcat:AEORegistryIdDetails">
											<tr>
												<td align="left" class="graph" style="width:4%"/>
												<td align="left" class="graph" style="width:46%">Номер свидетельства о включении в реестр уполномоченных экономических операторов</td>
												<td align="left" class="graph" style="width:50%"/>
											</tr>
											<xsl:for-each select="RUDECLcat:AEORegistryIdDetails">
												<table width="100%">
													<xsl:if test="catESAD_cu:RegistryOwnerCode">
														<tr>
															<td align="left" class="graph" style="width:8%"/>
															<td align="left" class="graph" style="width:42%">Код типа реестра уполномоченных экономических операторов</td>
															<td align="left" class="graph" style="width:50%">
																<xsl:value-of select="catESAD_cu:RegistryOwnerCode"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catESAD_cu:CountryA2Code">
														<tr>
															<td align="left" class="graph" style="width:8%"/>
															<td align="left" class="graph" style="width:42%">Кодовое обозначение страны</td>
															<td align="left" class="graph" style="width:50%">
																<xsl:value-of select="catESAD_cu:CountryA2Code"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td align="left" class="graph" style="width:8%"/>
														<td align="left" class="graph" style="width:42%">Регистрационный номер лица, присвоенный ему при включении в реестр, или регистрационный номер документа о включении лица в реестр</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:value-of select="catESAD_cu:DocId"/>
														</td>
													</tr>
													<xsl:if test="catESAD_cu:AEORegistryKindCode">
														<tr>
															<td align="left" class="graph" style="width:8%"/>
															<td align="left" class="graph" style="width:42%">Код типа свидетельства уполномоченного экономического оператора</td>
															<td align="left" class="graph" style="width:50%">
																<xsl:value-of select="catESAD_cu:AEORegistryKindCode"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catESAD_cu:ReregistrationCode">
														<tr>
															<td align="left" class="graph" style="width:8%"/>
															<td align="left" class="graph" style="width:42%">Кодовое обозначение признака перерегистрации документа</td>
															<td align="left" class="graph" style="width:50%">
																<xsl:value-of select="catESAD_cu:ReregistrationCode"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catESAD_cu:DocKindCode">
														<tr>
															<td align="left" class="graph" style="width:8%"/>
															<td align="left" class="graph" style="width:42%">Код вида документа</td>
															<td align="left" class="graph" style="width:50%">
																<xsl:value-of select="catESAD_cu:DocKindCode"/>
															</td>
														</tr>
													</xsl:if>
												</table>
											</xsl:for-each>
										</xsl:if>
									</table>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="tci:Guarantee">
								<xsl:for-each select="tci:Guarantee">
									<table width="100%">
										<tr>
											<td align="left" class="graph" colspan="2" style="width:100mm">Сведения о гарантии № <xsl:value-of select="position()"/></td>
											<td align="left" class="graph" style="width:100mm"/>
										</tr>
										<tr>
											<td align="left" class="graph" style="width:4%"/>
											<td align="left" class="graph" style="width:46%">Кодовое обозначение предоставления обеспечения исполнения обязанности по уплате таможенных и иных платежей</td>
											<td align="left" class="graph" style="width:50%">
												<xsl:value-of select="tci:GuaranteePresentCode"/>
											</td>
										</tr>
										<xsl:if test="tci:NoGuaranteeCauseCode">
											<tr>
												<td align="left" class="graph" style="width:4%"/>
												<td align="left" class="graph" style="width:46%">Кодовое обозначение основания для непредоставления обеспечения исполнения обязанности по уплате таможенных и иных платежей</td>
												<td align="left" class="graph" style="width:50%">
													<xsl:value-of select="tci:NoGuaranteeCauseCode"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="tci:TransitGuaranteeDocDetails">
											<xsl:for-each select="tci:TransitGuaranteeDocDetails">
												<tr>
													<td align="left" class="graph" style="width:4%"/>
													<td align="left" class="graph" style="width:46%" valign="top">
														<xsl:if test="position()=1">Сведения о документе, подтверждающем предоставление (принятие) либо основание для непредоставления обеспечения исполнения обязанности по уплате таможенных и иных платежей</xsl:if>
													</td>
													<td align="left" class="graph" style="width:50%">
														<xsl:value-of select="tci:DocName"/>
														<xsl:if test="tci:DocName and tci:DocKindCode">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="tci:DocKindCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
														<xsl:if test="tci:DocName"><br/></xsl:if>
														<xsl:if test="tci:GuaranteeCertificateIdDetails">
															<xsl:text>Сертификат обеспечения исполнения обязанности по уплате таможенных пошлин, налогов № </xsl:text>
															<xsl:value-of select="tci:GuaranteeCertificateIdDetails/tci:CustomsCode"/>
															<xsl:text>/</xsl:text>
															<xsl:call-template name="russian_date_gtd">
																<xsl:with-param name="dategtd" select="tci:GuaranteeCertificateIdDetails/tci:RegistrationDate"/>
															</xsl:call-template>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="tci:GuaranteeCertificateIdDetails/tci:SerialNumber"/>
															<xsl:if test="tci:DocCreationDate">
																<xsl:text> от </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="tci:DocCreationDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tci:GuaranteeCustomsDocIdDetails">
															<xsl:if test="tci:GuaranteeCertificateIdDetails"><br/></xsl:if>
															<xsl:text>Таможенный документ, подтверждающий принятие обеспечения исполнения обязанности по уплате таможенных и иных платежей № </xsl:text>
															<xsl:value-of select="tci:GuaranteeCustomsDocIdDetails/cat_ru:CustomsCode"/>
															<xsl:text>/</xsl:text>
															<xsl:call-template name="russian_date_gtd">
																<xsl:with-param name="dategtd" select="tci:GuaranteeCustomsDocIdDetails/cat_ru:RegistrationDate"/>
															</xsl:call-template>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="tci:GuaranteeCustomsDocIdDetails/cat_ru:GTDNumber"/>
															<xsl:if test="tci:DocCreationDate">
																<xsl:text> от </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="tci:DocCreationDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tci:DocID">
															<xsl:if test="tci:GuaranteeCertificateIdDetails or tci:GuaranteeCustomsDocIdDetails"><br/></xsl:if>
															<xsl:text>№ </xsl:text>
															<xsl:value-of select="tci:DocID"/>
															<xsl:if test="tci:DocCreationDate">
																<xsl:text> от </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="tci:DocCreationDate"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
														<xsl:if test="tci:GuaranteeAmount">
															<br/>
															<xsl:text>Сумма (размер) предоставленного обеспечения - </xsl:text>
															<xsl:value-of select="translate(translate(format-number(tci:GuaranteeAmount/RUScat_ru:Amount div 100, '#,###.00'),',',' '),'.',',')"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="tci:GuaranteeAmount/RUScat_ru:CurrencyCode"/>
														</xsl:if>
														<xsl:if test="tci:PaymentGuaranteeMethodCode">
															<br/>
															<xsl:text>Код способа обеспечения - </xsl:text>
															<xsl:value-of select="tci:PaymentGuaranteeMethodCode"/>
														</xsl:if>
														<xsl:if test="tci:ReferenceConsignmentItemOrdinal or tci:ReferenceConsignmentItemRangeDetails">
															<br/>
															<xsl:text>Порядковый(-е) номер(-а) товара(-ов) - </xsl:text>
															<xsl:for-each select="tci:ReferenceConsignmentItemOrdinal">
																<xsl:value-of select="."/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
															<xsl:if test="tci:ReferenceConsignmentItemOrdinal and tci:ReferenceConsignmentItemRangeDetails">; </xsl:if>
															<xsl:for-each select="tci:ReferenceConsignmentItemRangeDetails">
																<xsl:value-of select="tci:FirstReferenceOrdinal"/>
																<xsl:text> - </xsl:text>
																<xsl:value-of select="tci:LastReferenceOrdinal"/>
																<xsl:if test="position()!=last()">, </xsl:if>
															</xsl:for-each>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
									</table>
								</xsl:for-each>
							</xsl:if>
						</tbody>
					</table>
					<xsl:if test="tci:Seal">
						<table width="100%">
							<tbody>
								<tr>
									<td align="left" class="graph" colspan="3" style="width:100%">Информация о пломбах</td>
								</tr>
								<xsl:for-each select="tci:Seal">
									<tr>
										<td align="left" class="graph" style="width:4%"/>
										<td align="left" class="graph" style="width:46%">Код способа идентификации</td>
										<td align="left" class="graph" style="width:50%">
											<xsl:value-of select="tci:CustomsIdentificationMethodCode"/>
										</td>
									</tr>
									<xsl:if test="tci:CustomsIdentificationMeansKindCode">
										<tr>
											<td align="left" class="graph" style="width:4%"/>
											<td align="left" class="graph" style="width:46%">Код вида средств идентификации</td>
											<td align="left" class="graph" style="width:50%">
												<xsl:choose>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='01'">Пломбы</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='02'">Навигационные пломбы</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='03'">Печати</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='04'">Цифровая, буквенная или иная маркировка</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='05'">Идентификационные знаки</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='06'">Штампы</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='07'">Сейф-пакеты</xsl:when>
													<xsl:when test="tci:CustomsIdentificationMeansKindCode='99'">Иные средства, обеспечивающие идентификацию</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="tci:CustomsIdentificationMeansKindCode"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="tci:SealQuantity">
										<tr>
											<td align="left" class="graph" style="width:4%"/>
											<td align="left" class="graph" style="width:46%">Количество средств идентификации</td>
											<td align="left" class="graph" style="width:50%">
												<xsl:value-of select="tci:SealQuantity"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="tci:CustomsIdentificationMeansIdDetails">
										<xsl:for-each select="tci:CustomsIdentificationMeansIdDetails">
											<tr>
												<td align="left" colspan="2" class="graph" style="width:100mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													Сведения о средстве идентификации № <xsl:value-of select="position()"/>
												</td>
												<td align="left" class="graph" style="width:100mm"/>
											</tr>
											<xsl:if test="tci:CustomsIdentificationMeansId">
												<tr>
													<td align="left" class="graph" style="width:8%"/>
													<td align="left" class="graph" style="width:42%">Уникальный идентификатор (номер) средства идентификации</td>
													<td align="left" class="graph" style="width:50%">
														<xsl:value-of select="tci:CustomsIdentificationMeansId"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="tci:DescriptionText">
												<tr>
													<td align="left" class="graph" style="width:8%"/>
													<td align="left" class="graph" style="width:42%">Описание отличительных признаков</td>
													<td align="left" class="graph" style="width:50%">
														<xsl:value-of select="tci:DescriptionText"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="tci:ForeignCustomsIdentificationMeansIndicator">
												<tr>
													<td align="left" class="graph" style="width:8%"/>
													<td align="left" class="graph" style="width:42%">Признак признания таможенным органом средства идентификации</td>
													<td align="left" class="graph" style="width:50%">
														<xsl:if test="tci:ForeignCustomsIdentificationMeansIndicator='0' or tci:ForeignCustomsIdentificationMeansIndicator='false' or tci:ForeignCustomsIdentificationMeansIndicator='f'">Нет</xsl:if>
														<xsl:if test="tci:ForeignCustomsIdentificationMeansIndicator='1' or tci:ForeignCustomsIdentificationMeansIndicator='true' or tci:ForeignCustomsIdentificationMeansIndicator='t'">Да</xsl:if>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="tci:DescriptionText">
										<tr>
											<td align="left" class="graph" style="width:4%"/>
											<td align="left" class="graph" style="width:46%" valign="top">Описание идентификации</td>
											<td align="left" class="graph" style="width:50%">
												<xsl:for-each select="tci:DescriptionText">
													<xsl:value-of select="."/>
													<br/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<tr/>
									<tr/>
									<tr/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="tci:DetailsCargoOperation">
						<table style="width:100%;">
							<tbody>
								<tr>
									<td align="left" class="graph" colspan="3" style="width:100%">Cведения о планируемых грузовых операциях и (или) замене транспортных средств с удалением наложенных таможенных пломб и печатей:</td>
									<br/>
								</tr>
								<tr>
									<table align="center" style="border: 0; border-collapse: collapse; width:245mm;table-layout: fixed;word-break: break-all;">
										<tbody>
											<tr>
												<td align="center" class="graph borderNormal" style="width:10%">Кодовое<br/>обозначение<br/>вида грузовой<br/>операции</td>
												<td align="center" class="graph borderNormal" style="width:9%">Порядковый<br/>номер<br/>перевозчика</td>
												<td align="center" class="graph borderNormal" style="width:11%">Признак<br/>перегрузки<br/>товаров из<br/>одного<br/>контейнера<br/>в другой</td>
												<td align="center" class="graph borderNormal" style="width:6%">Код<br/>страны</td>
												<td align="center" class="graph borderNormal" style="width:10%">Наименование<br/>населенного<br/>пункта</td>
												<td align="center" class="graph borderNormal" style="width:10%">Кодовое<br/>обозначение<br/>таможенного<br/>органа</td>
												<td align="center" class="graph borderNormal" style="width:12%">Кодовое<br/>обозначение<br/>железнодорожной<br/>станции</td>
												<td align="center" class="graph borderNormal" style="width:22%">Сведения о транспортном<br/>средстве, с использованием<br/>которого продолжается<br/>перевозка (транспортировка)<br/>товаров</td>
												<td align="center" class="graph borderNormal" style="width:10%">Описание<br/>грузовой<br/>операции</td>
											</tr>
											<xsl:for-each select="tci:DetailsCargoOperation">
												<tr>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:CargoOperationKindCode"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:CarrierOrdinal"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:if test="tci:GoodsTranshsipmentIndicator='0' or tci:GoodsTranshsipmentIndicator='false' or tci:GoodsTranshsipmentIndicator='f'">Товары не<br/>перегружаются<br/>из одного<br/>контейнера<br/>в другой</xsl:if>
														<xsl:if test="tci:GoodsTranshsipmentIndicator='1' or tci:GoodsTranshsipmentIndicator='true' or tci:GoodsTranshsipmentIndicator='t'">Товары<br/>перегружаются<br/>из одного<br/>контейнера<br/>в другой</xsl:if>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:CACountryCode"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:PlaceName"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:CustomsOfficeCode"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:RailwayStationCode"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:for-each select="tci:TranshipmentTransportMeansDetails">
															<xsl:for-each select=".">
																<xsl:value-of select="."/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:for-each>
															<br/>
														</xsl:for-each>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:DescriptionText"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="tci:Header/tci:Transport">
						<table border="0" style="width:100%">
							<tbody>
								<tr>
									<td align="left" class="graphMain" colspan="3" style="width:100%">Сведения о транспортном средстве:</td>
								</tr>
								<xsl:for-each select="tci:Header/tci:Transport">
									<tr>
										<td style="width:2%;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="left" class="graph" style="width:48%">Код вида</td>
										<td align="left" class="graph" style="width:50%">
											<xsl:value-of select="cat_ru:TransportModeCode"/>
										</td>
									</tr>
									<tr>
										<td style="width:2%;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="left" class="graph" style="width:48%">Буквенный код страны принадлежности</td>
										<td align="left" class="graph" style="width:50%">
											<xsl:value-of select="cat_ru:TransportNationalityCode"/>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<table align="center" class="borderNormal" style="border: 0; border-collapse: collapse; width:165mm;">
												<tbody>
													<tr>
														<td align="center" class="graph borderNormal" style="width:15mm">Код типа</td>
														<td align="center" class="graph borderNormal" style="width:15mm">Код марки</td>
														<td align="center" class="graph borderNormal" style="width:25mm">Идентификационный номер</td>
														<td align="center" class="graph borderNormal" style="width:25mm">Номер шасси (VIN)</td>
														<td align="center" class="graph borderNormal" style="width:25mm">Буквенный код страны принадлежности</td>
														<td align="center" class="graph borderNormal" style="width:25mm">Идентификатор активного транспортного средства для прицепов, полуприцепов и др</td>
														<td align="center" class="graph borderNormal" style="width:30mm">Номер свидетельства о регистрации транспортного средства для РБ</td>
													</tr>
													<xsl:for-each select="tci:TransportMeans">
														<tr>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:TransportKindCode"/>
															</td>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:TransportMarkCode"/>
															</td>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:TransportIdentifier"/>
															</td>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:VIN"/>
															</td>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
															</td>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
															</td>
															<td align="center" class="graph borderNormal">
																<xsl:value-of select="cat_ru:TransportRegNumber"/>
															</td>
														</tr>
													</xsl:for-each>
													<!--tr>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportKindCode"/>
														</xsl:call-template>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportMarkCode"/>
														</xsl:call-template>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportIdentifier"/>
														</xsl:call-template>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:VIN"/>
														</xsl:call-template>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportMeansNationalityCode"/>
														</xsl:call-template>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:ActiveTransportIdentifier"/>
														</xsl:call-template>
														<xsl:call-template name="TransportMeans">
															<xsl:with-param name="tsm" select="tci:TransportMeans/cat_ru:TransportRegNumber"/>
														</xsl:call-template>
													</tr-->
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="tci:GoodsLocation">
						<table align="center" border="0" cellpadding="0" cellspacing="0" style="width:210mm;">
							<tbody>
								<br/>
								<tr>
									<td align="left" class="graph" style="width:100mm;" valign="top">Сведения о местонахождении товаров:</td>
								</tr>
							</tbody>
						</table>
						<table style="width:210mm;">
							<tbody>
								<xsl:variable name="glw" select="tci:GoodsLocation/tci:GoodsLocationWarehouse"/>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" style="width:70mm" valign="top">Разрешение таможенного органа:</td>
									<td align="left" class="graph" style="width:50%">
										<xsl:apply-templates mode="Docum" select="$glw"/>
										<xsl:if test="$glw/tci:PresentedDocumentModeCode">
											<br/>Код вида документа: <xsl:value-of select="$glw/tci:PresentedDocumentModeCode"/>
										</xsl:if>
										<xsl:if test="$glw/tci:DocStartDate">
											<br/>Дата начала срока, в течение которого документ имеет силу: 
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="$glw/tci:DocStartDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$glw/tci:DocValidityDate">
											<br/>Дата окончания срока, в течение которого документ имеет силу: 
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="$glw/tci:DocValidityDate"/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<table style="width:210mm;">
							<tbody>
								<xsl:variable name="rdid" select="tci:GoodsLocation/tci:RegisterDocumentIdDetails"/>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" style="width:70mm" valign="top">Свидетельство о включении в реестр или документ, удостоверяющий регистрацию лица в качестве резидента:</td>
									<td align="left" class="graph" style="width:50%">
										<xsl:text>Регистрационный номер лица или документа: </xsl:text>
										<xsl:value-of select="$rdid/catESAD_cu:DocId"/>
										<xsl:if test="$rdid/catESAD_cu:DocKindCode">
											<br/>Код вида документа: <xsl:value-of select="$rdid/catESAD_cu:DocKindCode"/>
										</xsl:if>
										<xsl:if test="$rdid/catESAD_cu:RegistryOwnerCode">
											<br/>Код типа реестра УЭО: <xsl:value-of select="$rdid/catESAD_cu:RegistryOwnerCode"/>
										</xsl:if>
										<xsl:if test="$rdid/catESAD_cu:AEORegistryKindCode">
											<br/>Код типа свидетельства УЭО: <xsl:value-of select="$rdid/catESAD_cu:AEORegistryKindCode"/>
										</xsl:if>
										<xsl:if test="$rdid/catESAD_cu:CountryA2Code">
											<br/>Кодовое обозначение страны: <xsl:value-of select="$rdid/catESAD_cu:CountryA2Code"/>
										</xsl:if>
										<xsl:if test="$rdid/catESAD_cu:ReregistrationCode">
											<br/>Признак перерегистрации документа: <xsl:value-of select="$rdid/catESAD_cu:ReregistrationCode"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table align="center" border="0" style="width:210mm">
						<tbody>
							<br/>
							<!--xsl:variable name="pl" select="tci:DestinationPlace"/-->
							<tr>
								<td align="left" class="graph" style="width:100mm" valign="top">Сведения о месте назначения:</td>
								<td align="left" class="graph" style="width:100mm">
									<xsl:apply-templates select="tci:DestinationPlace"/>
									<!--xsl:value-of select="$pl/cat_ru:Code"/>
									<xsl:if test="$pl/cat_ru:OfficeName"> - <xsl:value-of select="$pl/cat_ru:OfficeName"/>
									</xsl:if>
									<xsl:if test="$pl/cat_ru:OfficeName"> (Код государства: <xsl:value-of select="$pl/cat_ru:CustomsCountryCode"/>)</xsl:if>
									<xsl:if test="$pl/tci:PlaceDescription">
										<br/>Место доставки: <xsl:value-of select="$pl/tci:PlaceDescription"/>
									</xsl:if>
									<xsl:if test="$pl/tci:RegistrationCertificate">
										<br/>Свидетельство о включении в реестр УЭО: <xsl:call-template name="Docum">
											<xsl:with-param name="doc" select="$pl/tci:RegistrationCertificate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$pl/tci:RWstation">
										<br/>
										<xsl:if test="$pl/tci:RWstation/tci:RailwayCode">Железная дорога <xsl:value-of select="$pl/tci:RWstation/tci:RailwayCode"/>, </xsl:if>Станция <xsl:value-of select="$pl/tci:RWstation/tci:StationCode"/>
										<xsl:if test="$pl/tci:RWstation/tci:StationName"> - <xsl:value-of select="$pl/tci:RWstation/tci:StationName"/>
										</xsl:if>
									</xsl:if-->
								</td>
							</tr>
						</tbody>
					</table>
					<table align="center" border="0" cellpadding="0" cellspacing="0" style="width:210mm;">
						<tbody>
							<br/>
							<tr>
								<td align="left" class="graph" style="width:100mm" valign="top">Сведения о перевозчике:</td>
								<td align="left" class="graph" style="width:100mm">
									<xsl:apply-templates mode="org" select="tci:Header/tci:Carrier"/>
									<!--xsl:call-template name="Consignor">
										<xsl:with-param name="cons" select="tci:Header/tci:Carrier"/>
									</xsl:call-template-->
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="tci:CustomsOfficial">
						<table align="center" border="0" style="width:210mm">
							<tbody>
								<tr>
									<td align="left" class="graph" style="width:100mm">Сведения о должностном лице таможенного органа, проставившем штамп:</td>
									<td align="left" class="graph" style="width:100mm" valign="top">
										<xsl:value-of select="tci:CustomsOfficial/cat_ru:PersonName"/>
										<xsl:if test="tci:CustomsOfficial/cat_ru:LNP">; ЛНП - <xsl:value-of select="tci:CustomsOfficial/cat_ru:LNP"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="tci:PrecedingDocument">
						<table align="center" border="0" style="width:210mm">
							<tbody>
								<tr>
									<td align="left" class="graph" style="width:100mm" valign="top">Предшествующие документы:</td>
									<td align="left" class="graph" style="width:100mm" valign="top">
										<xsl:for-each select="tci:PrecedingDocument">
											<xsl:text>Тип предшествующего документа: </xsl:text>
											<xsl:value-of select="tci:DocumentKind"/>
											<xsl:text> </xsl:text>   
											<xsl:apply-templates mode="Docum" select="."/>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table align="center" border="0" cellpadding="0" cellspacing="0" style="width:210mm;">
						<tbody>
							<tr>
								<td align="left" class="graph" style="width:100mm;" valign="top">Сведения о товарно-транспортной накладной:</td>
							</tr>
						</tbody>
					</table>
					<xsl:for-each select="tci:Consigment">
						<table style="width:210mm;">
							<tbody>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" style="width:70mm" valign="top">Тип представленного документа:</td>
									<td align="left" class="graph" style="width:50%">
										<xsl:value-of select="tci:DocumentKind"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates mode="Docum" select="."/>
									</td>
								</tr>
								<xsl:if test="tci:ArchDocInfo">
									<tr>
										<td style="width:10mm;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="left" class="graph" style="width:75mm" valign="top">Информация о размещении документа в электронном архиве:</td>
										<td align="left" class="graph" style="width:50%">
											<xsl:for-each select="tci:ArchDocInfo">
												<xsl:text>Идентификатор электронного архива декларанта - </xsl:text>
												<xsl:value-of select="tci:ArchID"/>
												<br/>
												<xsl:text>Идентификатор документа в электронном архиве декларанта - </xsl:text>   
												<xsl:value-of select="tci:ArchDocID"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" style="width:70mm" valign="top">Порядковый номер накладной:</td>
									<td align="left" class="graph" style="width:50%">
										<xsl:value-of select="tci:Sequence"/>
									</td>
								</tr>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" style="width:70mm" valign="top">Грузоотправитель:</td>
									<td align="left" class="graph" style="width:50%">
										<xsl:apply-templates mode="org" select="tci:Consignor"/>
										<!--xsl:call-template name="Consignor">
											<xsl:with-param name="cons" select="tci:Consignor"/>
										</xsl:call-template-->
									</td>
								</tr>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" style="width:70mm" valign="top">Грузополучатель:</td>
									<td align="left" class="graph" style="width:50%">
										<xsl:apply-templates mode="org" select="tci:Consignee"/>
										<!--xsl:call-template name="Consignor">
											<xsl:with-param name="cons" select="tci:Consignee"/>
										</xsl:call-template-->
									</td>
								</tr>
								<xsl:if test="tci:ProducedDocument">
									<tr>
										<td style="width:10mm;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td align="left" class="graph" style="width:75mm" valign="top">Представленные документы:</td>
										<td align="left" class="graph" style="width:50%">
											<xsl:for-each select="tci:ProducedDocument">
												<xsl:text>Тип представленного документа: </xsl:text>
												<xsl:value-of select="tci:DocumentKind"/>
												<xsl:text> </xsl:text>   
												<xsl:apply-templates mode="Docum" select="."/>
												<br/>
												<xsl:for-each select="tci:ArchDocInfo">
													<xsl:text>Идентификатор электронного архива декларанта - </xsl:text>
													<xsl:value-of select="tci:ArchID"/>
													<br/>
													<xsl:text>Идентификатор документа в электронном архиве декларанта - </xsl:text>   
													<xsl:value-of select="tci:ArchDocID"/>
													<br/>
												</xsl:for-each>
												<xsl:for-each select="tci:DocumentPresentingDetails">
													<xsl:if test="RUDECLcat:DocPresentKindCode">
														<xsl:text>Признак представления документа при подаче таможенной декларации (заявления) - </xsl:text>
														<xsl:value-of select="RUDECLcat:DocPresentKindCode"/>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:PresentedDocumentModeCode">
														<xsl:text>Код вида представляемого документа - </xsl:text>
														<xsl:value-of select="RUDECLcat:PresentedDocumentModeCode"/>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:DocPresentDate">
														<xsl:text>Дата, до которой должны быть выполнены обязательства по представлению документа - </xsl:text>
														<xsl:value-of select="RUDECLcat:DocPresentDate"/>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:CustomsDocIdDetails">
														<xsl:text>Регистрационный номер декларации на товары, транзитной декларации, заявления о выпуске товаров до подачи декларации на товары или заявления о совершении операций в отношении временно вывезенных транспортных средств международной перевозки, являющихся товарами, помещенными под таможенную процедуру временного ввоза (допуска), к которой (которому) был приложен представленный документ - </xsl:text>
														<xsl:value-of select="RUDECLcat:CustomsDocIdDetails/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
															<xsl:with-param name="dategtd" select="RUDECLcat:CustomsDocIdDetails/cat_ru:RegistrationDate"/>
														</xsl:call-template>/<xsl:value-of select="RUDECLcat:CustomsDocIdDetails/cat_ru:GTDNumber"/>
														<xsl:if test="RUDECLcat:CustomsDocIdDetails/RUDECLcat:Code">
															<xsl:text> (номер (идентификатор) вносимых изменений и (или) дополнений - </xsl:text>
															<xsl:value-of select="RUDECLcat:CustomsDocIdDetails/RUDECLcat:Code"/>
															<xsl:text> )</xsl:text>
														</xsl:if>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:DTMDocDetails">
														<xsl:text>Регистрационный номер декларации на транспортное средство, к которой был приложен представленный документ - </xsl:text>
														<xsl:value-of select="RUDECLcat:DTMDocDetails/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
															<xsl:with-param name="dategtd" select="RUDECLcat:DTMDocDetails/cat_ru:RegistrationDate"/>
														</xsl:call-template>/<xsl:value-of select="RUDECLcat:DTMDocDetails/cat_ru:GTDNumber"/>
														<xsl:if test="RUDECLcat:DTMDocDetails/RUDECLcat:TransportModeCode">
															<xsl:text> (код вида ТС - </xsl:text>
															<xsl:value-of select="RUDECLcat:DTMDocDetails/RUDECLcat:TransportModeCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:TIRIdDetails">
														<xsl:text>Номер книжки МДП, которая использовалась в качестве транзитной декларации и к которой был приложен представленный документ - </xsl:text>
														<xsl:value-of select="RUDECLcat:TIRIdDetails/RUDECLcat:TIRSeries"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="RUDECLcat:TIRIdDetails/RUDECLcat:TIRID"/>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:OtherPrecedingDocId">
														<xsl:text>Регистрационный номер иного документа, к которому был приложен представляемый документ - </xsl:text>
														<xsl:value-of select="RUDECLcat:OtherPrecedingDocId"/>
														<br/>
													</xsl:if>
													<xsl:if test="RUDECLcat:OtherPrecedingDocDate">
														<xsl:text>Дата выдачи, подписания, утверждения или регистрации иного документа, к которому был приложен представляемый документ - </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="RUDECLcat:OtherPrecedingDocDate"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
												</xsl:for-each>
											</xsl:for-each>
											<br/>
											<br/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td style="width:10mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="left" class="graph" colspan="2" style="width:165mm" valign="top">Сведения о товарах:</td>
									<br/>
									<table align="center" style="border: 0; border-collapse: collapse; width:245mm;table-layout: fixed;word-break: break-all;">
										<tbody>
											<tr>
												<td align="center" class="graph borderNormal" style="width:4%">№<br/>п/п</td>
												<td align="center" class="graph borderNormal" style="width:10%mm">Наименование</td>
												<td align="center" class="graph borderNormal" style="width:10%">Код<br/>ТН ВЭД<br/>ЕАЭС</td>
												<td align="center" class="graph borderNormal" style="width:4%">Вес,<br/>брут-<br/>то/<br/>Вес,<br/>нетто</td>
												<td align="center" class="graph borderNormal" style="width:4%">Вес,<br/>нетто<br/>без<br/>учета<br/>упа-<br/>ковки</td>
												<td align="center" class="graph borderNormal" style="width:10%">Цена/<br/>стоимость</td>
												<td align="center" class="graph borderNormal" style="width:10%">Таможенная<br/>стоимость</td>
												<td align="center" class="graph borderNormal" style="width:10%">Статисти-<br/>ческая<br/>стоимость</td>
												<td align="center" class="graph borderNormal" style="width:6%">Коли-<br/>чество<br/>товара<br/>(в доп.<br/>ед. изм.)</td>
												<td align="center" class="graph borderNormal" style="width:6%">Доп. ед.<br/>изм.</td>
												<td align="center" class="graph borderNormal" style="width:6%">Номера<br/>контей-<br/>неров</td>
												<td align="center" class="graph borderNormal" style="width:4%">МПО<br/>/<br/>ЭКГ</td>
												<td align="center" class="graph borderNormal" style="width:10%">Сведения<br/>об<br/>упаковке<br/>товаров</td>
												<td align="center" class="graph borderNormal" style="width:6%">Признак<br/>свободы<br/>от<br/>прим-я<br/>запр.<br/>и огр-й</td>
											</tr>
											<xsl:for-each select="tci:GoodsItem">
												<tr>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="catESAD_cu:GoodsNumeric"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:for-each select="catESAD_cu:GoodsDescription">
															<xsl:value-of select="."/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:for-each>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:TNVEDCode"/>
														<br/>
													</td>
													<td align="center" class="graph borderNormal" style="width:15mm">
														<xsl:value-of select="catESAD_cu:GrossWeightQuantity"/>
														<xsl:if test="catESAD_cu:NetWeightQuantity"> / <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
														</xsl:if>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="catESAD_cu:NetWeightQuantity2"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:if test="catESAD_cu:InvoicedCost">
															<xsl:value-of select="format-number(catESAD_cu:InvoicedCost,'0.00')"/>
														</xsl:if>
														<xsl:if test="catESAD_cu:InvoicedCurrencyCode">/<xsl:value-of select="catESAD_cu:InvoicedCurrencyCode"/>
														</xsl:if>
														<xsl:if test="tci:CurrencyCode">/<xsl:value-of select="tci:CurrencyCode"/>
														</xsl:if>
														<xsl:if test="catESAD_cu:InvoicedCurrencyRate">/<xsl:value-of select="format-number(catESAD_cu:InvoicedCurrencyRate,'0.0000')"/>
														</xsl:if>
														<xsl:if test="catESAD_cu:InvoicedCurrencyDate">
															<br/>
															<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="catESAD_cu:InvoicedCurrencyDate"/></xsl:call-template>
														</xsl:if>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="catESAD_cu:CustomsCost"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:if test="catESAD_cu:StatisticalCost">
															<xsl:value-of select="format-number(catESAD_cu:StatisticalCost,'0.00')"/>
														</xsl:if>
														<xsl:if test="catESAD_cu:TotalStatisticValueAmount"> / <xsl:value-of select="format-number(catESAD_cu:TotalStatisticValueAmount,'0.00')"/>
														</xsl:if>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="tci:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:for-each select="tci:ContainerIdentificator">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">, </xsl:if>
														</xsl:for-each>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:value-of select="catESAD_cu:GoodFeatures"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:apply-templates select="tci:GoodsPackaging"/>
													</td>
													<td align="center" class="graph borderNormal">
														<xsl:apply-templates select="tci:GoodsProhibitionFreeCode"/>
														<xsl:if test="tci:ForeignCustomsIdentificationMeansIndicator='0'">Нет</xsl:if>
														<xsl:if test="tci:ForeignCustomsIdentificationMeansIndicator='1'">Да</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<xsl:if test="tci:SignatoryRepresentativeDetails">
						<table width="100%">
							<tbody>
								<tr>
									<td align="left" class="graph" colspan="3" style="width:100%">Сведения о таможенном представителе</td>
								</tr>
								<xsl:for-each select="tci:SignatoryRepresentativeDetails">
									<table width="96%">
										<tbody>
											<tr>
												<td align="left" class="graph" colspan="3" style="width:100%">Сведения о включении лица в реестр таможенных представителей</td>
											</tr>
											<xsl:for-each select="RUDECLcat:BrokerRegistryDocDetails">
												<xsl:if test="RUDECLcat:DocKindCode">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%">Код вида документа</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:value-of select="RUDECLcat:DocKindCode"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="RUDECLcat:CountryA2Code">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%">Кодовое обозначение страны</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:value-of select="RUDECLcat:CountryA2Code"/>
														</td>
													</tr>
												</xsl:if>
												<tr>
													<td align="left" class="graph" style="width:4%"/>
													<td align="left" class="graph" style="width:46%">Регистрационный номер в реестре таможенных представителей</td>
													<td align="left" class="graph" style="width:50%">
														<xsl:value-of select="RUDECLcat:RegistrationNumberId"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
									<table width="96%">
										<tbody>
											<tr>
												<td align="left" class="graph" colspan="3" style="width:100%">Договор таможенного представителя с декларантом (заявителем)</td>
											</tr>
											<xsl:for-each select="RUDECLcat:RepresentativeContractDetails">
												<xsl:if test="cat_ru:PrDocumentName or cat_ru:PrDocumentNumber or cat_ru:PrDocumentDate">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%">Реквизиты договора</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:apply-templates mode="Docum" select="."/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="RUScat_ru:DocStartDate">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%">Дата начала срока, в течение которого документ имеет силу</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:value-of select="RUScat_ru:DocStartDate"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="RUScat_ru:DocValidityDate">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%">Дата окончания срока, в течение которого документ имеет силу</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:value-of select="RUScat_ru:DocValidityDate"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="RUScat_ru:DocKindCode">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%">Код вида документа в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:value-of select="RUScat_ru:DocKindCode"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="RUDECLcat:DocArchIdDetails">
													<tr>
														<td align="left" class="graph" style="width:4%"/>
														<td align="left" class="graph" style="width:46%" valign="top">Идентификаторы, присвоенные документу (сведениям) при размещении в хранилище электронных документов</td>
														<td align="left" class="graph" style="width:50%">
															<xsl:if test="RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">
																<xsl:text>Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде - </xsl:text>
																<xsl:value-of select="RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicDocumentID"/>
															</xsl:if>
															<xsl:if test="RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicArchID">
																<xsl:if test="RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicArchID"><br/></xsl:if>
																<xsl:text>Идентификатор хранилища электронных документов при представлении документа в электронном виде - </xsl:text>
																<xsl:value-of select="RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicArchID"/>
															</xsl:if>
															<xsl:if test="RUDECLcat:DocArchIdDetails/catESAD_cu:DocumentModeID">
																<xsl:if test="RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicDocumentID or RUDECLcat:DocArchIdDetails/catESAD_cu:ElectronicArchID"><br/></xsl:if>
																<xsl:text>Код вида представленного документа в соответствии с альбомом форматов электронных форм документов - </xsl:text>
																<xsl:value-of select="RUDECLcat:DocArchIdDetails/catESAD_cu:DocumentModeID"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="tci:DestinationPlace">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName"> - <xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
		<xsl:if test="cat_ru:OfficeName"> (Код государства: <xsl:value-of select="cat_ru:CustomsCountryCode"/>)</xsl:if>
		<xsl:if test="tci:PlaceDescription">
			<br/>Место доставки: <xsl:value-of select="tci:PlaceDescription"/>
		</xsl:if>
		<xsl:if test="tci:RegistrationCertificate">
			<br/>
			<xsl:text>Свидетельство о включении в реестр УЭО: </xsl:text>
			<xsl:apply-templates mode="Docum" select="tci:RegistrationCertificate"/>
		</xsl:if>
		<xsl:if test="tci:RWstation">
			<br/>
			<xsl:if test="tci:RWstation/tci:RailwayCode">Железная дорога <xsl:value-of select="tci:RWstation/tci:RailwayCode"/>, </xsl:if>Станция <xsl:value-of select="tci:RWstation/tci:StationCode"/>
			<xsl:if test="tci:RWstation/tci:StationName"> - <xsl:value-of select="tci:RWstation/tci:StationName"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!--xsl:template name="Consignor"-->
	<xsl:template mode="org" match="*">
		<!--xsl:param name="cons"/-->
		<!--xsl:for-each select="$cons"-->
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
			<br/>
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
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<span class="header">Адрес:</span>
			<br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<!--/xsl:for-each-->
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:ESADGoodsPackagingType-->
	<xsl:template match="tci:GoodsPackaging">
		<xsl:for-each select="*">
			<xsl:if test="name()='catESAD_cu:PakageTypeCode'">
				<xsl:choose>
					<xsl:when test=".='0'">
						<xsl:text>Без упаковки</xsl:text>
					</xsl:when>
					<xsl:when test=".='1'">
						<xsl:text>С упаковкой</xsl:text>
					</xsl:when>
					<xsl:when test=".='2'">
						<xsl:text>Без упаковки в оборудованных емкостях транспортного средства</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="name()='catESAD_cu:PakageQuantity'">
				<xsl:text>Общее кол-во груз. мест, занятых товаром: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="name()='catESAD_cu:PakagePartQuantity'">
				<xsl:text>Кол-во груз. мест,частично  занятых товаром: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="name()='catESAD_cu:PackagePalleteInformation'">
				<xsl:for-each select=".">
					<xsl:for-each select="*">
						<!--xsl:if test="preceding-sibling::*[1] and local-name(preceding-sibling::*[1])!='CargoDescriptionText'"><xsl:text>@; </xsl:text></xsl:if-->
						<xsl:if test="name()='catESAD_cu:InfoKindCode'">
							<xsl:choose>
								<xsl:when test=".='0'">
									<xsl:text>упаковка, </xsl:text>
								</xsl:when>
								<xsl:when test=".='1'">
									<xsl:text>тара, </xsl:text>
								</xsl:when>
								<xsl:when test=".='2'">
									<xsl:text>груз, </xsl:text>
								</xsl:when>
								<xsl:when test=".='3'">
									<xsl:text>поддон, </xsl:text>
								</xsl:when>
								<xsl:when test=".='4'">
									<xsl:text>индивидуальная упаковка, </xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="name()='catESAD_cu:PalleteCode'">
							<xsl:text>код: </xsl:text>
							<xsl:value-of select="."/>
						</xsl:if>
						<xsl:if test="name()='catESAD_cu:PalleteQuantity'">
							<xsl:text>кол-во: </xsl:text>
							<xsl:value-of select="."/>
						</xsl:if>
						<xsl:if test="name()='catESAD_cu:CargoDescriptionText'">
							<xsl:apply-templates select="."/>
						</xsl:if>
						<xsl:if test="position()!=last() and name()!='catESAD_cu:InfoKindCode' and name()!='catESAD_cu:CargoDescriptionText'">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="position()!=last()">
				<xsl:text>; </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
		<br/>
	</xsl:template>
	<xsl:template match="cat_ru:Address | catESAD_cu:GuaranteeAddress">
		<span class="header">Адрес:</span>
		<br/>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<!--xsl:template name="TransportMeans">
		<xsl:param name="tsm"/>
		<td align="center" class="graph" style="width:15mm">
			<xsl:choose>
				<xsl:when test="$tsm">
					<xsl:value-of select="$tsm"/>
				</xsl:when>
				<xsl:otherwise> </xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template-->
	<!--xsl:template name="Docum"-->
	<xsl:template mode="Docum" match="*">
		<xsl:for-each select="./*">
			<!--xsl:param name="doc"/-->
			<xsl:if test="name()='cat_ru:PrDocumentName'">
				<xsl:value-of select="."/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="name()='cat_ru:PrDocumentNumber'">
				<xsl:text> № </xsl:text>
				<xsl:value-of select="."/> 
			</xsl:if>
			<xsl:if test="name()='cat_ru:PrDocumentDate'">
				<xsl:text> от </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="."/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="header">Документ, удостоверяющий личность:</span>
		<br/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="RUScat_ru:IdentityCardName">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа - <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="*" mode="ru_address">
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
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
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
</xsl:stylesheet>
