CoD.FirstTimeLanguageSelectLanguageWidget = InheritFrom( LUI.UIElement )
CoD.FirstTimeLanguageSelectLanguageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FirstTimeLanguageSelectLanguageWidget )
	self.id = "FirstTimeLanguageSelectLanguageWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 238 )
	self:setTopBottom( true, false, 0, 53 )
	
	local EnglishLanguageImage = LUI.UIImage.new()
	EnglishLanguageImage:setLeftRight( true, false, 0, 238 )
	EnglishLanguageImage:setTopBottom( true, false, 0, 53 )
	EnglishLanguageImage:setAlpha( 0 )
	EnglishLanguageImage:setImage( RegisterImage( "uie_language_english" ) )
	self:addElement( EnglishLanguageImage )
	self.EnglishLanguageImage = EnglishLanguageImage
	
	local ArabicLanguageImage = LUI.UIImage.new()
	ArabicLanguageImage:setLeftRight( true, false, 0, 238 )
	ArabicLanguageImage:setTopBottom( true, false, 0, 53 )
	ArabicLanguageImage:setAlpha( 0 )
	ArabicLanguageImage:setImage( RegisterImage( "uie_language_arabic" ) )
	self:addElement( ArabicLanguageImage )
	self.ArabicLanguageImage = ArabicLanguageImage
	
	local ChineseLanguageImage = LUI.UIImage.new()
	ChineseLanguageImage:setLeftRight( true, false, 0, 238 )
	ChineseLanguageImage:setTopBottom( true, false, 0, 53 )
	ChineseLanguageImage:setAlpha( 0 )
	ChineseLanguageImage:setImage( RegisterImage( "uie_language_simplified_chinese" ) )
	self:addElement( ChineseLanguageImage )
	self.ChineseLanguageImage = ChineseLanguageImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EnglishLanguageImage:completeAnimation()
				self.EnglishLanguageImage:setAlpha( 0 )
				self.clipFinished( EnglishLanguageImage, {} )
				ArabicLanguageImage:completeAnimation()
				self.ArabicLanguageImage:setAlpha( 0 )
				self.clipFinished( ArabicLanguageImage, {} )
				ChineseLanguageImage:completeAnimation()
				self.ChineseLanguageImage:setAlpha( 0 )
				self.clipFinished( ChineseLanguageImage, {} )
			end
		},
		Chinese = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EnglishLanguageImage:completeAnimation()
				self.EnglishLanguageImage:setAlpha( 0 )
				self.clipFinished( EnglishLanguageImage, {} )
				ArabicLanguageImage:completeAnimation()
				self.ArabicLanguageImage:setAlpha( 0 )
				self.clipFinished( ArabicLanguageImage, {} )
				ChineseLanguageImage:completeAnimation()
				self.ChineseLanguageImage:setAlpha( 1 )
				self.clipFinished( ChineseLanguageImage, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EnglishLanguageImage:completeAnimation()
				self.EnglishLanguageImage:setAlpha( 0 )
				self.clipFinished( EnglishLanguageImage, {} )
				ArabicLanguageImage:completeAnimation()
				self.ArabicLanguageImage:setAlpha( 1 )
				self.clipFinished( ArabicLanguageImage, {} )
				ChineseLanguageImage:completeAnimation()
				self.ChineseLanguageImage:setAlpha( 0 )
				self.clipFinished( ChineseLanguageImage, {} )
			end
		},
		English = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EnglishLanguageImage:completeAnimation()
				self.EnglishLanguageImage:setAlpha( 1 )
				self.clipFinished( EnglishLanguageImage, {} )
				ArabicLanguageImage:completeAnimation()
				self.ArabicLanguageImage:setAlpha( 0 )
				self.clipFinished( ArabicLanguageImage, {} )
				ChineseLanguageImage:completeAnimation()
				self.ChineseLanguageImage:setAlpha( 0 )
				self.clipFinished( ChineseLanguageImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Chinese",
			condition = function ( menu, element, event )
				local f6_local0 = IsChineseSku()
				if f6_local0 then
					f6_local0 = IsCurrentLanguageEnglish()
				end
				return f6_local0
			end
		},
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				local f7_local0 = IsArabicSku()
				if f7_local0 then
					f7_local0 = IsCurrentLanguageEnglish()
				end
				return f7_local0
			end
		},
		{
			stateName = "English",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCurrentLanguageEnglish() then
					f8_local0 = not IsJapaneseSku()
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

