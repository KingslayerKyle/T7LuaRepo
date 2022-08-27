-- f46c658310f79f073e41f0c12fbb2d28
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 53 )
	
	local EnglishLanguageImage = LUI.UIImage.new()
	EnglishLanguageImage:setLeftRight( true, false, 0, 272 )
	EnglishLanguageImage:setTopBottom( true, false, 0, 53 )
	EnglishLanguageImage:setAlpha( 0 )
	EnglishLanguageImage:setImage( RegisterImage( "uie_loc_choose_language_english" ) )
	self:addElement( EnglishLanguageImage )
	self.EnglishLanguageImage = EnglishLanguageImage
	
	local ArabicLanguageImage = LUI.UIImage.new()
	ArabicLanguageImage:setLeftRight( true, false, 7, 227 )
	ArabicLanguageImage:setTopBottom( true, false, -4, 58 )
	ArabicLanguageImage:setAlpha( 0 )
	ArabicLanguageImage:setImage( RegisterImage( "uie_loc_choose_language_arabic" ) )
	self:addElement( ArabicLanguageImage )
	self.ArabicLanguageImage = ArabicLanguageImage
	
	local ChineseLanguageImage = LUI.UIImage.new()
	ChineseLanguageImage:setLeftRight( true, false, 0, 189 )
	ChineseLanguageImage:setTopBottom( true, false, 0, 53 )
	ChineseLanguageImage:setAlpha( 0 )
	ChineseLanguageImage:setImage( RegisterImage( "uie_loc_choose_language_simplifiedchinese" ) )
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
				return IsChineseSku() and IsCurrentLanguageEnglish()
			end
		},
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsArabicSku() and IsCurrentLanguageEnglish()
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

