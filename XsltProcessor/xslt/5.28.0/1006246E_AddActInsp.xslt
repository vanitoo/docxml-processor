<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.28.0" xmlns:aai="urn:customs.ru:Information:CustomsDocuments:AddActInsp:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AddActInspType -->
	
	<xsl:param name="BusinessProcessType"/>
	
	<xsl:template match="aai:AddActInsp">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 270mm;
									max-width: 270mm;
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
									max-width: 100%;
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
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>
											<xsl:text>Дополнение/приложение к акту досмотра/осмотра/наблюдения/изменения СТИ</xsl:text>
										</b>
										<!--Дополнение к акту фактического контроля--><!--досмотра/осмотра-->
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="title marg-top">Сведения об акте<!--АТД--></div>
					<xsl:if test="aai:Act_ID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">Уникальный идентификатор акта<!--АТД--></td>
								<td class="value graphMain" style="width:70%">
									<xsl:value-of select="aai:Act_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:30%">Номер акта <!--АТД--></td>
							<td class="value graphMain" style="width:70%">
								<xsl:value-of select="aai:ATDNum"/>
							</td>
						</tr>
					</table>
					<xsl:if test="aai:Comments">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">Комментарии</td>
								<td class="graphMain value" style="width:70%">
									<xsl:for-each select="aai:Comments">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Информация о вложении</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Уникальный идентификатор изображения</td>
								<td class="graphMain bordered">Дата и время<br/>создания/<br/>сохранения<br/>изображения</td>
								<td class="graphMain bordered">Формат изображения</td>
								<td class="graphMain bordered">Владелец</td>
								<td class="graphMain bordered">Имя файла</td>
								<td class="graphMain bordered">Миниатюрное изображение</td>
								<td class="graphMain bordered">Описание вложения содержит</td>
								<td class="graphMain bordered">Комментарии к изображению</td>
								<td class="graphMain bordered">Сведения об участнике ВЭД</td>
							</tr>
							<xsl:for-each select="aai:PreviewInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="aai:NumberOfPhoto">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">Количество приложенных фотографий</td>
								<td class="graphMain value" style="width:70%">
									<xsl:value-of select="aai:NumberOfPhoto"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="aai:InspectionParticipant">
						<div class="title marg-top">Сведения о подписи АТД</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">ФИО, должность</td>
									<td class="graphMain bordered">Статус лица</td>
									<td class="graphMain bordered">Статус подписи</td>
									<td class="graphMain bordered">Дата подписи</td>
								</tr>
								<xsl:for-each select="aai:InspectionParticipant">
									<tr>
										<td class="graphMain bordered">
											<xsl:for-each select="*[contains(local-name(), 'ame')]">
												<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
												<xsl:value-of select="."/>
											</xsl:for-each>
											<xsl:if test="cat_ru:PersonPost">
												<xsl:text>, </xsl:text>
												<xsl:value-of select="cat_ru:PersonPost"/>
											</xsl:if>
										</td>
										<td class="graphMain bordered">
											<xsl:choose>
												<xsl:when test="aai:Status = 3">декларант (иное лицо, уполномоченное в отношении товаров, либо представитель)</xsl:when>
												<xsl:when test="aai:Status = 4">понятой</xsl:when>
												<xsl:when test="aai:Status = 5">эксперт</xsl:when>
												<xsl:when test="aai:Status = 6">оператор почтовой связи</xsl:when>
												<xsl:when test="aai:Status = 9">должностное лицо ТО</xsl:when>
												<xsl:otherwise><xsl:apply-templates select="aai:Status"/></xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="graphMain bordered">
											<xsl:choose>
												<xsl:when test="aai:SignatureFlag = 1">подписан в бумажном виде</xsl:when>
												<xsl:when test="aai:SignatureFlag = 2">подписан ЭП</xsl:when>
												<xsl:when test="aai:SignatureFlag = 3">отказ от подписи в электронном виде</xsl:when>
												<xsl:when test="aai:SignatureFlag = 4">истек таймаут для подписания ЭП</xsl:when>
												<xsl:when test="aai:SignatureFlag = 5">досмотр прерван по причине выпуска товаров</xsl:when>
												<xsl:otherwise><xsl:apply-templates select="aai:SignatureFlag"/></xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="graphMain bordered">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="aai:SignPersonDate"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="aai:InspectionReqGoods">
						<div class="title marg-top">Требование о предъявлении товаров </div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Дата и время требования</td>
									<td class="graphMain bordered">Назначенный срок</td>
									<td class="graphMain bordered">Дата и время выполнения требования</td>
									<td class="graphMain bordered">Дата и время внесения записи о невыполнении требования</td>
								</tr>
								<xsl:apply-templates select="aai:InspectionReqGoods"/>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="aai:ReqOperations">
						<div class="title marg-top">Требование о проведении грузовых и иных операций в отношении товаров</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Дата и время требования</td>
									<td class="graphMain bordered">Назначенный срок</td>
									<td class="graphMain bordered">Дата и время выполнения требования</td>
									<td class="graphMain bordered">Дата и время внесения записи о невыполнении требования</td>
								</tr>
								<xsl:apply-templates select="aai:ReqOperations"/>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="aai:SignatureDate">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:30%">Дата и время окончания досмотра</td>
								<td class="graphMain value" style="width:70%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aai:SignatureDate"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(aai:SignatureDate, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="aai:InspectionReqGoods|aai:ReqOperations">
		<tr>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aai:OperationDirect"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aai:Limit"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aai:SuccessDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="aai:IgnoreDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	
	<!-- Шаблон для типа ATDcat:AddInfoType -->
	<xsl:template match="ATDcat:AddInfo">
		<xsl:if test="ATDcat:AllView and (ATDcat:AllView='true' or ATDcat:AllView='1')">
			<xsl:text>общий вид, </xsl:text>
		</xsl:if>
		<xsl:if test="ATDcat:Transport and (ATDcat:Transport='true' or ATDcat:Transport='1')">транспортное средство, </xsl:if>
		<xsl:if test="ATDcat:LoadTransport and (ATDcat:LoadTransport='true' or ATDcat:LoadTransport='1')">загрузка транспортного средства, </xsl:if>
		<xsl:if test="ATDcat:Insp and (ATDcat:Insp='true' or ATDcat:Insp='1')">инспектор, </xsl:if>
		<xsl:if test="ATDcat:Pack and (ATDcat:Pack='true' or ATDcat:Pack='1')">упаковка, </xsl:if>
		<xsl:if test="ATDcat:Mark and (ATDcat:Mark='true' or ATDcat:Mark='1')">маркировка, </xsl:if>
		<xsl:if test="ATDcat:Physical and (ATDcat:Physical='true' or ATDcat:Physical='1')">физические параметры товара, </xsl:if>
		<xsl:if test="ATDcat:Weighing and (ATDcat:Weighing='true' or ATDcat:Weighing='1')">взвешивание, </xsl:if>
		<xsl:if test="ATDcat:Other and (ATDcat:Other='true' or ATDcat:Other='1')">иное</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="ATDcat:Person">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ATDcat:PreviewInfoType -->
	<xsl:template match="aai:PreviewInfo">
		<xsl:variable name="lower">
			pngjegfi
		</xsl:variable>
		<xsl:variable name="upper">
			PNGJEGFI
		 </xsl:variable>
		<xsl:variable name="f_ex4">
			<xsl:value-of select="translate(substring(ATDcat:FileName,string-length(ATDcat:FileName)-3,4),$upper,$lower)"/>
		</xsl:variable>
		<xsl:variable name="f_ex5">
			<xsl:value-of select="translate(substring(ATDcat:FileName,string-length(ATDcat:FileName)-4,5),$upper,$lower)"/>
		</xsl:variable>
		<xsl:variable name="ftype">
			<xsl:choose>
				<xsl:when test="$BusinessProcessType">
					<xsl:comment>with BusinessProcessType</xsl:comment>
					<xsl:choose>
						<xsl:when test="$f_ex4='.jpg' or $f_ex5='.jpeg'">
							<xsl:value-of select="'data:image/jpeg;base64,'"/>
						</xsl:when>
						<xsl:when test="$f_ex4='.gif'">
							<xsl:value-of select="'data:image/jpeg;base64,'"/>
						</xsl:when>
						<xsl:when test="$f_ex4='.png'">
							<xsl:value-of select="'data:image/png;base64,'"/>
						</xsl:when>
						<xsl:when test="$f_ex4='.avi' or $f_ex4='.mp4'">
							<xsl:value-of select="'data:image/jpeg;base64,'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'button'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:comment>without BusinessProcessType</xsl:comment>
					<xsl:choose>
						<xsl:when test="$f_ex4='.jpg' or $f_ex5='.jpeg'">
							<xsl:value-of select="'data:image/jpeg;base64,'"/>
						</xsl:when>
						<xsl:when test="$f_ex4='.png'">
							<xsl:value-of select="'data:image/png;base64,'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'button'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			
		</xsl:variable>
		<tr>
			<td class="graphMain bordered" style="word-break: break-all">
				<xsl:value-of select="ATDcat:ImageID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ATDcat:ImageDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(ATDcat:ImageDate, 12, 8)"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ATDcat:Type"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="ATDcat:Person">
					<xsl:apply-templates select="ATDcat:Person"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ATDcat:FileName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="$ftype='button'">
						<xsl:comment>ftype == button</xsl:comment>
						<table width="190">
							<tbody>
								<tr>
									<td align="center">
										<xsl:for-each select="ATDcat:Preview">
											<input type="button" value="Просмотр" OnClick="1006110E" Hint="Просмотр содержимого файла"/>
											<div class="data" style="display:none;">
												<xsl:value-of select="."/>
											</div>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:when>
					<xsl:otherwise>
						<xsl:comment>ftype != button</xsl:comment>
						<xsl:choose>
							<xsl:when test="$BusinessProcessType">
								<xsl:comment> with BusinessProcessType</xsl:comment>
								<table width="190">
									<tbody>
										<tr>
											<td align="center">
												<img>
													<xsl:attribute name="src"><xsl:value-of select="concat($ftype,ATDcat:Preview)"/></xsl:attribute>
												</img>
												<xsl:variable name="imgId" select="ATDcat:ImageID"/>
												<xsl:variable name="addId" select="../cat_ru:DocumentID"/>
												<br/>
												<input type="button" onclick="window.external.OpenFullPhoto('{$imgId}', '{$addId}')" value="Просмотр" Hint="Просмотр полноразмерного фото"/>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:when>
							<xsl:otherwise>
								<xsl:comment> without BusinessProcessType</xsl:comment>
								<table width="190">
									<tbody>
										<tr>
											<td align="center">
												<img>
													<xsl:attribute name="src"><xsl:value-of select="concat($ftype,ATDcat:Preview)"/></xsl:attribute>
												</img>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:otherwise>
						</xsl:choose>
						
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="ATDcat:AddInfo">
					<xsl:apply-templates select="ATDcat:AddInfo"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ATDcat:Comments"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ATDcat:Declarant"/>
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
