<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:eact="urn:customs.ru:Information:CustomsDocuments:Energy_Act:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0">
	<!-- Шаблон для типа Energy_ActType -->
	<xsl:template match="eact:Energy_Act">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
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
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Акт перемещения энергоресурсов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>-->
					<xsl:if test="eact:Electric_Power_Act">
						<div class="title marg-top">Акты учета экспорта электричества</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Тек. показания - показания счетчика последнего дня текущего месяца</td>
									<td class="graphMain bordered">Ист. показания - показания счетчика последнего дня предыдущего месяца</td>
									<td class="graphMain bordered">Коэффициент умножения счетчика</td>
									<td class="graphMain bordered">Номер счетчика</td>
									<td class="graphMain bordered">Прием/Отдача - направление движения электроэнергии</td>
									<td class="graphMain bordered">Примечание</td>
									<td class="graphMain bordered">ЛЭП</td>
									<td class="graphMain bordered">Код места таможенного контроля</td>
									<td class="graphMain bordered">Код потребителя электроэнергии</td>
								</tr>
								<xsl:for-each select="eact:Electric_Power_Act">
									<tr>
										<td class="value bordered">
											<xsl:value-of select="translate(eact:Current_Meter_Value, '.', ',')"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="translate(eact:Prev_Meter_Value, '.', ',')"/>
										</td>
										<td class="graphMain bordered">
											<xsl:value-of select="translate(eact:Meter_Factor, '.', ',')"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Meter_Number"/>
										</td>
										<td class="value bordered">
											<xsl:choose>
												<xsl:when test="eact:Direction='0'">
													<xsl:text>Прием</xsl:text>
												</xsl:when>
												<xsl:when test="eact:Direction='1'">
													<xsl:text>Отдача</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="eact:Direction"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Note"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Power_Lines"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_MTK"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_RP"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="eact:Oil_Act">
						<div class="title marg-top">Акты учета экспорта нефти</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Дата акта</td>
									<td class="graphMain bordered">Номер акта</td>
									<td class="graphMain bordered">Номер декларации</td>
									<td class="graphMain bordered">Обозначение нефти по ГОСТ, ТУ </td>
									<td class="graphMain bordered">Вес брутто</td>
									<td class="graphMain bordered">Производитель</td>
									<td class="graphMain bordered">Вес нетто</td>
									<td class="graphMain bordered">Примечание</td>
									<td class="graphMain bordered">Дата маршрутной телеграммы</td>
									<td class="graphMain bordered">Номер маршрутной телеграммы</td>
									<td class="graphMain bordered">Код таможни</td>
									<td class="graphMain bordered">Код ЛПДС</td>
								</tr>
								<xsl:for-each select="eact:Oil_Act">
									<tr>
										<td class="value bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param select="eact:Act_Date" name="dateIn"/>
											</xsl:call-template>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Act_Number"/>
										</td>
										<td class="value bordered">
											<xsl:apply-templates select="eact:Decl_Number"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:GOST_Name"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="translate(eact:Gross_Weight, '.', ',')"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Manufacturer"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="translate(eact:Net_Weight, '.', ',')"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Note"/>
										</td>
										<td class="value bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="eact:Route_Telegram_Date"/>
											</xsl:call-template>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Route_Telegram_Number"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Customs_ID"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_LPDS"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="eact:Gas_Act">
						<div class="title marg-top">Акты учета экспорта газа</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Дата акта</td>
									<td class="graphMain bordered">Страна происхождения</td>
									<td class="graphMain bordered">Прием/Отдача - направление движения газа</td>
									<td class="graphMain bordered">Российские потребители</td>
									<td class="graphMain bordered">№ замерной нитки</td>
									<td class="graphMain bordered">Примечание</td>
									<td class="graphMain bordered">Трубопровод</td>
									<td class="graphMain bordered">Объем перемещенного газа в тыс. куб. м.</td>
									<td class="graphMain bordered">Код ГИС</td>
								</tr>
								<xsl:for-each select="eact:Gas_Act">
									<tr>
										<td class="value bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param select="eact:Act_Date" name="dateIn"/>
											</xsl:call-template>
										</td>
										<td class="value bordered">
											<xsl:apply-templates select="eact:Country"/>
										</td>
										<td class="value bordered">
											<xsl:choose>
												<xsl:when test="eact:Direction='0'">
													<xsl:text>Прием</xsl:text>
												</xsl:when>
												<xsl:when test="eact:Direction='1'">
													<xsl:text>Отдача</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="eact:Direction"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value bordered">
											<xsl:choose>
												<xsl:when test="eact:Is_Rus_Consumers='true' or eact:Is_Rus_Consumers='1'">
													<xsl:text>ДА</xsl:text>
												</xsl:when>
												<xsl:when test="eact:Is_Rus_Consumers='false' or eact:Is_Rus_Consumers='0'">
													<xsl:text>НЕТ</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="eact:Is_Rus_Consumers"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Metering_Thread_Number"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Note"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Pipeline"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="translate(eact:Volume, '.', ',')"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_GIS"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="eact:Oil_Product_Act">
						<div class="title marg-top">Акты учета экспорта нефтепродуктов</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Дата акта</td>
									<td class="graphMain bordered">Номер акта</td>
									<td class="graphMain bordered">Номер декларации</td>
									<td class="graphMain bordered">Вес брутто</td>
									<td class="graphMain bordered">Производитель</td>
									<td class="graphMain bordered">Марка нефтепродуктов</td>
									<td class="graphMain bordered">Описание</td>
									<td class="graphMain bordered">Перекачивающая станция</td>
									<td class="graphMain bordered">Маршрут</td>
									<td class="graphMain bordered">Дата маршрутной телеграммы</td>
									<td class="graphMain bordered">Номер маршрутной телеграммы</td>
									<td class="graphMain bordered">Код таможни</td>
									<td class="graphMain bordered">Код ЛПДС</td>
									<td class="graphMain bordered">Код нефтебазы</td>
									<td class="graphMain bordered">Код организации</td>
								</tr>
								<xsl:for-each select="eact:Oil_Product_Act">
									<tr>
										<td class="value bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param select="eact:Act_Date" name="dateIn"/>
											</xsl:call-template>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Act_Number"/>
										</td>
										<td class="value bordered">
											<xsl:apply-templates select="eact:Decl_Number"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="translate(eact:Gross_Weight, '.', ',')"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Manufacturer"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Mark"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Note"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Puming_Station"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Route"/>
										</td>
										<td class="value bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param select="eact:Route_Telegram_Date" name="dateIn"/>
											</xsl:call-template>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Route_Telegram_Number"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Customs_ID"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_LPDS"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_Psnp"/>
										</td>
										<td class="value bordered">
											<xsl:value-of select="eact:Kod_Org"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа eact:CountryType -->
	<xsl:template match="eact:Country">
		<xsl:if test="eact:Name"/>
		<xsl:if test="eact:Code">
			<xsl:if test="eact:Name">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="eact:Name"/>
			<xsl:if test="eact:Name">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="eact:Decl_Number">
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>/<xsl:value-of select="cat_ru:GTDNumber"/>
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
