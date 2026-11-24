<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:verp="urn:customs.ru:Information:SertifDocuments:VeterinaryPermission:5.25.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа VeterinaryPermissionType -->
	<xsl:template match="verp:VeterinaryPermission">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

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
					font-size: 11pt;}

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
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Ответ на запрос ветеринарного разрешения</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br />
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID" />
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:MCD_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:MCD_ID" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор цепочки обмена сообщениями</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="verp:UUID" />
							</td>
						</tr>
					</table>
					<xsl:if test="verp:responseCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Код ответа сервера</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="verp:responseCode" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="verp:veterinaryPermitCount">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Количество ветеринарных разрешений</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="verp:veterinaryPermitCount" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="verp:VeterinaryPermit">
						<div class="title marg-top">Ветеринарное разрешение</div>
						<xsl:for-each select="verp:VeterinaryPermit">
							<b><u><xsl:value-of select="position()"/></u></b>
							<xsl:if test="verp:PermitUUID">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Идентификатор документа в системе РСХН</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:PermitUUID" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Series">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Серия документа</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Series" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Number">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Номер документа</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Number" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Date">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Дата документа</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Date" mode="russian_date" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Name">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Название документа</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Name" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:YearPermit">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Год, на который выдано разрешение</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:YearPermit" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Decision">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Решение (разрешение или запрет)</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Decision" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:CentralDepartment">
								<div class="title marg-top">ГУВ страны ТС, оформившее разрешения</div>
								<div>
									<xsl:apply-templates select="verp:CentralDepartment">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:vetDepartment">
								<div class="title marg-top">Ветеринарное управления субъекта страны ТС, в который следует груз</div>
								<div>
									<xsl:apply-templates select="verp:vetDepartment">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:SignedBy">
								<div class="title marg-top">Должностное лицо, ответственное за выдачу разрешения</div>
								<div>
									<xsl:apply-templates select="verp:SignedBy">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:isGeneral">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Является ли решение генеральным (общим)</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="verp:isGeneral='true' or verp:isGeneral='1'">
													<xsl:text>ДА</xsl:text>
												</xsl:when>
												<xsl:when test="verp:isGeneral='false' or verp:isGeneral='0'">
													<xsl:text>НЕТ</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="verp:isGeneral" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:TransferType">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Тип операции</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="verp:TransferType='1'">
													<xsl:text>Ввоз (импорт на территорию ТС)</xsl:text>
												</xsl:when>
												<xsl:when test="verp:TransferType='2'">
													<xsl:text>Вывоз (экспорт из ТС в третьи страны)</xsl:text>
												</xsl:when>
												<xsl:when test="verp:TransferType='3'">
													<xsl:text>Транзит через территорию ТС</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="verp:TransferType" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:WhichProductType">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Тип продукции</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="verp:WhichProductType='1'">
													<xsl:text>Мясо и мясопродукты</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='2'">
													<xsl:text>Корма и кормовые добавки</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='3'">
													<xsl:text>Живые животные</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='4'">
													<xsl:text>Лекарственные средства</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='5'">
													<xsl:text>Пищевые продукты</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='6'">
													<xsl:text>Непищевые продукты и другое</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='7'">
													<xsl:text>Рыба и морепродукты</xsl:text>
												</xsl:when>
												<xsl:when test="verp:WhichProductType='8'">
													<xsl:text>Продукция, не требующая разрешения</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="verp:WhichProductType" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:TransferPurpose">
								<div class="title marg-top">Цель ввоза/вывоза</div>
								<div>
									<xsl:apply-templates select="verp:TransferPurpose">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:BusinessEntity">
								<div class="title marg-top">Заявитель</div>
								<div>
									<xsl:apply-templates select="verp:BusinessEntity">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:OriginCountry">
								<div class="title marg-top">Страна происхождения груза</div>
								<div>
									<xsl:apply-templates select="verp:OriginCountry">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:ImportCountry">
								<div class="title marg-top">Страна-импортер</div>
								<div>
									<xsl:apply-templates select="verp:ImportCountry">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:ExportCountry">
								<div class="title marg-top">Страна-экспортер</div>
								<div>
									<xsl:apply-templates select="verp:ExportCountry">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:Supplier">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Предприятие-поставщик животных</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Supplier" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Recipient">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Получатель</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Recipient" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:Mediator">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Посредник доставки груза</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:Mediator" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:CustomsClearanceRegion">
								<div class="title marg-top">Регион полного таможенного оформления</div>
								<div>
									<xsl:apply-templates select="verp:CustomsClearanceRegion">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:StoragePoint">
								<div class="title marg-top">Место хранения груза</div>
								<div>
									<xsl:apply-templates select="verp:StoragePoint">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:ShipmentPoint">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Место доставки груза</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:ShipmentPoint" />
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:BipListRestricted">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Признак ограниченности списка допустимых пунктов пропуска</td>
										<td class="value graphMain" style="width:50%">
											<xsl:choose>
												<xsl:when test="verp:BipListRestricted='true' or verp:BipListRestricted='t' or verp:BipListRestricted='1'">
													<xsl:text>Список допустимых пунктов пропуска ограничен. Перечень приводится в элементе "Список допустимых пунктов пропуска"</xsl:text>
												</xsl:when>
												<xsl:when test="verp:BipListRestricted='false' or verp:BipListRestricted='f' or verp:BipListRestricted='0'">
													<xsl:text>Список допустимых пунктов пропуска не ограничен. Допускается транспорт груза через любой пункт пропуска ТС</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="verp:BipListRestricted" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:BorderInspectonPointList">
								<div class="title marg-top">Список допустимых пунктов пропуска</div>
								<div>
									<xsl:apply-templates select="verp:BorderInspectonPointList">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:TransportTypeList">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Список допустимых типов транспорта</td>
										<td class="value graphMain" style="width:50%">
											<xsl:for-each select="verp:TransportTypeList/verp:TransportType">
												<xsl:choose>
													<xsl:when test=".='0'">
														<xsl:text>Не определено</xsl:text>
													</xsl:when>
													<xsl:when test=".='1'">
														<xsl:text>Автомобильный</xsl:text>
													</xsl:when>
													<xsl:when test=".='2'">
														<xsl:text>Железнодорожный</xsl:text>
													</xsl:when>
													<xsl:when test=".='3'">
														<xsl:text>Авиатранспортьный</xsl:text>
													</xsl:when>
													<xsl:when test=".='4'">
														<xsl:text>Морской/речной</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="." />
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="verp:CargoList">
								<div class="title marg-top">Список грузов</div>
								<div>
									<xsl:apply-templates select="verp:CargoList">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:TransferConditioinList">
								<div class="title marg-top">Список условий транспортировки груза</div>
								<div>
									<xsl:apply-templates select="verp:TransferConditioinList">
										<xsl:with-param name="wdth" select="$w" />
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="verp:AddtonalInfo">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">Дополнительная информация</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="verp:AddtonalInfo" />
										</td>
									</tr>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
  <!-- Шаблон для типа verp:BorderInspectonPointListType -->
  <xsl:template match="verp:BorderInspectonPointList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
		  <xsl:if test="verp:UUID">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:UUID" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		  <xsl:if test="verp:GUID">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:GUID" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		  <xsl:if test="verp:NameOne">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Название допустимого пункта пропуска 1</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:NameOne" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
        <td class="graphMain bordered">
          <xsl:if test="verp:CountryOne">
            <xsl:apply-templates select="verp:CountryOne">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:RegionOne">
            <xsl:apply-templates select="verp:RegionOne">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
		  <xsl:if test="verp:NameOne">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Адрес допустимого пункта пропуска 1</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:AddessOne" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		  <xsl:if test="verp:NameOne">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Название допустимого пункта пропуска 2</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:NameTwo" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
        <td class="graphMain bordered">
          <xsl:if test="verp:CountryTwo">
            <xsl:apply-templates select="verp:CountryTwo">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:RegionTwo">
            <xsl:apply-templates select="verp:RegionTwo">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
		  <xsl:if test="verp:NameOne">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Адрес допустимого пункта пропуска 2</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:AddessTwo" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		<xsl:if test="verp:TransportType">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Список допустимых типов транспорта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="verp:TransportType='0'">
								<xsl:text>Не определено</xsl:text>
							</xsl:when>
							<xsl:when test="verp:TransportType='1'">
								<xsl:text>Автомобильный</xsl:text>
							</xsl:when>
							<xsl:when test="verp:TransportType='2'">
								<xsl:text>Железнодорожный</xsl:text>
							</xsl:when>
							<xsl:when test="verp:TransportType='3'">
								<xsl:text>Авиатранспортьный</xsl:text>
							</xsl:when>
							<xsl:when test="verp:TransportType='4'">
								<xsl:text>Морской/речной</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="verp:TransportType" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:BusinessEntityType -->
  <xsl:template match="verp:BusinessEntity">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:FirmName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полное наименование хозяйствующего объекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:FirmName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:FIO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ФИО хозяйствующего объекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:FIO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:SingleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование хозяйствующего субъекта без ОПФ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:SingleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:IncorpoprationForm">
        <div class="title marg-top">Организационно-правовая форма</div>
        <div>
          <xsl:apply-templates select="verp:IncorpoprationForm">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Passport">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Паспортные данные</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Passport" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер ХС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП субъекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН(ИП) субъекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Страна регистрации ХС</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Регион регистрации ХС</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Юридический адрес или адрес регистрации ХС</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="verp:Address">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Type">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Тип ХС</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="verp:Type">
                <xsl:choose>
					<xsl:when test=".='1'">
						<xsl:text>Юридическое лицо</xsl:text>
					</xsl:when>
					<xsl:when test=".='2'">
						<xsl:text>Физическое лицо</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="." />
					</xsl:otherwise>
				</xsl:choose>
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CargoDetailsType -->
  <xsl:template match="verp:CargoDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:ProductName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование продукции</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:ProductName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:TNVEDCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ТНВЭД</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:TNVEDCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:ProductPurpose">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Назначение продукции</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:ProductPurpose" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:FormOfIssue">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Форма выпуска</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:FormOfIssue" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:ComponentComposition">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Компонентный состав</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:ComponentComposition" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GMO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наличие ГМО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:GMO='true' or verp:GMO='1'">
                  <xsl:text>ДА</xsl:text>
                </xsl:when>
                <xsl:when test="verp:GMO='false' or verp:GMO='0'">
                  <xsl:text>НЕТ</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:GMO" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GMOName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование ГМО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GMOName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:PlantComponent">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наличие компонентов растительного происхождения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:PlantComponent='true' or verp:PlantComponent='1'">
                  <xsl:text>ДА</xsl:text>
                </xsl:when>
                <xsl:when test="verp:PlantComponent='false' or verp:PlantComponent='0'">
                  <xsl:text>НЕТ</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:PlantComponent" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:AnimalComponent">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наличие компонентов животного происхождения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:AnimalComponent='true' or verp:AnimalComponent='1'">
                  <xsl:text>ДА</xsl:text>
                </xsl:when>
                <xsl:when test="verp:AnimalComponent='false' or verp:AnimalComponent='0'">
                  <xsl:text>НЕТ</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:AnimalComponent" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Additionalnfo">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дополнительная информация</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Additionalnfo" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:FishCatchDistrict">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Район вылова водных биоресурсов</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:FishCatchDistrict" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Packing">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Упаковка, фасовка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Packing" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationRequired">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Требуется ли наличие обязательной регистрации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:RegistrationRequired='true' or verp:RegistrationRequired='1'">
                  <xsl:text>ДА</xsl:text>
                </xsl:when>
                <xsl:when test="verp:RegistrationRequired='false' or verp:RegistrationRequired='0'">
                  <xsl:text>НЕТ</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:RegistrationRequired" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationCertifcateSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер учетной серии свидетельства о регистрации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegistrationCertifcateSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationCertifcateNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регистрационный номер свидетельства о регистрации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegistrationCertifcateNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationCertifcateBeginDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата начала действия свидетельства о регистрации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegistrationCertifcateBeginDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationCertifcateEndDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания действия свидетельства о регистрации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegistrationCertifcateEndDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationCertifcateUnlimited">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Cвидетельство о регистрации выдано бессрочно</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:RegistrationCertifcateUnlimited='true' or verp:RegistrationCertifcateUnlimited='1'">
                  <xsl:text>ДА</xsl:text>
                </xsl:when>
                <xsl:when test="verp:RegistrationCertifcateUnlimited='false' or verp:RegistrationCertifcateUnlimited='0'">
                  <xsl:text>НЕТ</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:RegistrationCertifcateUnlimited" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegistrationCertifcateOwner">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кому выдано свидетельство о регистрации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegistrationCertifcateOwner" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:CoveredByCites">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Груз попадает под действие СИТЕС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:CoveredByCites='true' or verp:CoveredByCites='1'">
                  <xsl:text>ДА</xsl:text>
                </xsl:when>
                <xsl:when test="verp:CoveredByCites='false' or verp:CoveredByCites='0'">
                  <xsl:text>НЕТ</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:CoveredByCites" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:CitesDocumentUUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор документа CИТЕС в системе РСХН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:CitesDocumentUUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:CitesDocumentSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа CИТЕС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:CitesDocumentSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:CitesDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа CИТЕС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:CitesDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:CitesDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа CИТЕС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:CitesDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:CitesDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название документа CИТЕС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:CitesDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CargoListType -->
  <xsl:template match="verp:CargoList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <xsl:if test="verp:CodeWithnPermit">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Шифр груза в разрешении</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:CodeWithnPermit" />
				</td>
			  </tr>
			</table>
		</xsl:if>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:Product">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:SubProduct">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <xsl:if test="verp:CargoAmount">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Объем груза</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:CargoAmount" />
				</td>
			  </tr>
			</table>
		</xsl:if>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:CargoUnit">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:OriginCountry">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:OriginRegion">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:OriginDistrict">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="verp:OriginLocality">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:EnterpriseList">
            <xsl:apply-templates select="verp:EnterpriseList">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <xsl:if test="verp:Producer">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Предприятие-производитель текстом</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:Producer" />
				</td>
			  </tr>
			</table>
		</xsl:if>
        <td class="graphMain bordered">
          <xsl:if test="verp:CargoDetails">
            <xsl:apply-templates select="verp:CargoDetails">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CargoUnitType -->
  <xsl:template match="verp:CargoUnit">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование единицы измерения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы измерения в соответствии с Общероссийским классификатором</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:DepartmentType -->
  <xsl:template match="verp:CentralDepartment">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Информация о регионе</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Юридический адрес</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="verp:Address">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CityType -->
  <xsl:template match="verp:City">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CountryType -->
  <xsl:template match="verp:Country">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Двухбуквенный код страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CountryType -->
  <xsl:template match="verp:CountryOne">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Двухбуквенный код страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CountryType -->
  <xsl:template match="verp:CountryTwo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Двухбуквенный код страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:RegionType -->
  <xsl:template match="verp:CustomsClearanceRegion">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionISOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с ISO 3166-2</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionISOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionRUSCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с Общероссийским классификатором</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionRUSCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:DistrictType -->
  <xsl:template match="verp:District">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название района страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Страна</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Регион страны</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:EnterpriseListType -->
  <xsl:template match="verp:EnterpriseList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <xsl:if test="verp:UUID">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:UUID" />
				</td>
			  </tr>
			</table>
		</xsl:if>
		<xsl:if test="verp:GUID">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:GUID" />
				</td>
			  </tr>
			</table>
		</xsl:if>
		<xsl:if test="verp:Number">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Номер предприятия</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:for-each select="verp:Number">
					<xsl:if test="position()!=1">, </xsl:if>
					<xsl:value-of select="." />
				  </xsl:for-each>
				</td>
			  </tr>
			</table>
		</xsl:if>
		<xsl:if test="verp:Name">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Название предприятия</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:Name" />
				</td>
			  </tr>
			</table>
		</xsl:if>
		<xsl:if test="verp:EngName">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Название предприятия на английском языке</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:EngName" />
				</td>
			  </tr>
			</table>
		</xsl:if>
		<xsl:if test="verp:Activity">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Деятельность, осуществляемая предприятием</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:Activity" />
				</td>
			  </tr>
			</table>
		</xsl:if>
		<xsl:if test="verp:EngActivity">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Деятельность, осуществляемая предприятием, на английском языке</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:EngActivity" />
				</td>
			  </tr>
			</table>
		</xsl:if>
        <td class="graphMain bordered">
          <xsl:if test="verp:Country">
            <xsl:apply-templates select="verp:Country">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:Region">
            <xsl:apply-templates select="verp:Region">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:District">
            <xsl:apply-templates select="verp:District">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:Locality">
            <xsl:apply-templates select="verp:Locality">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <xsl:if test="verp:Address">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Адрес предприятия</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:Address" />
				</td>
			  </tr>
			</table>
		</xsl:if>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CountryType -->
  <xsl:template match="verp:ExportCountry">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Двухбуквенный код страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CountryType -->
  <xsl:template match="verp:ImportCountry">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Двухбуквенный код страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:IncorpoprationFormType -->
  <xsl:template match="verp:IncorpoprationForm">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организационно-правовой формы</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Короткое организационно-правовой наименование формы</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код организационно-правовой формы</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:LocalityType -->
  <xsl:template match="verp:Locality">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название населенного пункта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Страна</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Регион страны</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:District">
        <div class="title marg-top">Район страны</div>
        <div>
          <xsl:apply-templates select="verp:District">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:City">
        <div class="title marg-top">Вышестоящий населенный пункт</div>
        <div>
          <xsl:apply-templates select="verp:City">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:CountryType -->
  <xsl:template match="verp:OriginCountry">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Двухбуквенный код страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:DistrictType -->
  <xsl:template match="verp:OriginDistrict">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название района страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Страна</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Регион страны</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:LocalityType -->
  <xsl:template match="verp:OriginLocality">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название населенного пункта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Страна</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Регион страны</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:District">
        <div class="title marg-top">Район страны</div>
        <div>
          <xsl:apply-templates select="verp:District">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:City">
        <div class="title marg-top">Вышестоящий населенный пункт</div>
        <div>
          <xsl:apply-templates select="verp:City">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:RegionType -->
  <xsl:template match="verp:OriginRegion">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionISOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с ISO 3166-2</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionISOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionRUSCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с Общероссийским классификатором</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionRUSCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:ProductType -->
  <xsl:template match="verp:Product">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ТНВЭД</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:ProductType">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Тип продукции</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="verp:ProductType='1'">
                  <xsl:text>Мясо и мясопродукты</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='2'">
                  <xsl:text>Корма и кормовые добавки</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='3'">
                  <xsl:text>Живые животные</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='4'">
                  <xsl:text>Лекарственные средства</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='5'">
                  <xsl:text>Пищевые продукты</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='6'">
                  <xsl:text>Непищевые продукты и другое</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='7'">
                  <xsl:text>Рыба и морепродукты</xsl:text>
                </xsl:when>
                <xsl:when test="verp:ProductType='8'">
                  <xsl:text>Продукция, не требующая разрешения</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="verp:ProductType" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:RegionType -->
  <xsl:template match="verp:Region">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionISOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с ISO 3166-2</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionISOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionRUSCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с Общероссийским классификатором</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionRUSCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:RegionType -->
  <xsl:template match="verp:RegionOne">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionISOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с ISO 3166-2</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionISOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionRUSCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с Общероссийским классификатором</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionRUSCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:RegionType -->
  <xsl:template match="verp:RegionTwo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование региона страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionISOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с ISO 3166-2</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionISOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:RegionRUSCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код региона страны в соответствии с Общероссийским классификатором</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:RegionRUSCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:SignedByType -->
  <xsl:template match="verp:SignedBy">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ФИО</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="verp:FIO" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Должность</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="verp:JobPosition" />
          </td>
        </tr>
      </table>
      <xsl:if test="verp:Organization">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Organization" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Контактный телефон</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Phone" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Email">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Email" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:StoragePointType -->
  <xsl:template match="verp:StoragePoint">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
		  <xsl:if test="verp:UUID">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:UUID" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		  <xsl:if test="verp:GUID">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:GUID" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		  <xsl:if test="verp:Name">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Название предприятия</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:Name" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
        <td class="graphMain bordered">
          <xsl:if test="verp:Country">
            <xsl:apply-templates select="verp:Country">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:Region">
            <xsl:apply-templates select="verp:Region">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:District">
            <xsl:apply-templates select="verp:District">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="verp:Locality">
            <xsl:apply-templates select="verp:Locality">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
		  <xsl:if test="verp:Address">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Адрес предприятия</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:apply-templates select="verp:Address" />
				</td>
			  </tr>
			</table>
		  </xsl:if>
		  <xsl:if test="verp:StoragePurpose">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Назначение меса хранения</td>
				<td class="value graphMain" style="width:50%">
				  <xsl:for-each select="verp:StoragePurpose">
					<xsl:choose>
						<xsl:when test=".='1'">
						  <xsl:text>Временная передержка</xsl:text>
						</xsl:when>
						<xsl:when test=".='2'">
						  <xsl:text>Выращивание</xsl:text>
						</xsl:when>
						<xsl:when test=".='3'">
						  <xsl:text>Инкубирование</xsl:text>
						</xsl:when>
						<xsl:when test=".='4'">
						  <xsl:text>Карантинирование</xsl:text>
						</xsl:when>
						<xsl:when test=".='5'">
						  <xsl:text>Размещение</xsl:text>
						</xsl:when>
						<xsl:when test=".='6'">
						  <xsl:text>Убой</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="." />
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position()!=last()">
					  <xsl:text>, </xsl:text>
					</xsl:if>
				  </xsl:for-each>
				</td>
			  </tr>
			</table>
		  </xsl:if>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:SubProductType -->
  <xsl:template match="verp:SubProduct">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Название</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ТНВЭД</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Product">
        <div class="title marg-top">Продукция, к которой относится данный вид продукции</div>
        <div>
          <xsl:apply-templates select="verp:Product">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:TransferConditioinListType -->
  <xsl:template match="verp:TransferConditioinList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:Conditon">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Условия транспортировки груза</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="verp:Conditon">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:TransferPurposeType -->
  <xsl:template match="verp:TransferPurpose">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование цели</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Code">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код цели</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Code" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа verp:DepartmentType -->
  <xsl:template match="verp:vetDepartment">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="verp:UUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор сущности</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:UUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:GUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор для версионируемых сущностей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:GUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Name">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="verp:Name" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="verp:Country">
        <div class="title marg-top">Информация о стране</div>
        <div>
          <xsl:apply-templates select="verp:Country">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Region">
        <div class="title marg-top">Информация о регионе</div>
        <div>
          <xsl:apply-templates select="verp:Region">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="verp:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Юридический адрес</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="verp:Address">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
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
  <xsl:template match="//*[local-name()='VeterinaryPermission']//*" priority="-1">
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