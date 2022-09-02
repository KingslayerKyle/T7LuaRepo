-- 42bee57ec1cb0b2679f8bf88f63644ee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.baseTextWidth, f1_arg0.baseTextHeight = f1_arg0.stepText:getLocalSize()
	f1_arg0.getHeightInList = function ( f2_arg0 )
		return Engine.GetNumTextLines( f2_arg0.stepText:getText(), CoD.fonts.Default, f2_arg0.baseTextHeight, f2_arg0.baseTextWidth ) * f2_arg0.baseTextHeight + 6
	end
	
end

CoD.MissionObjectiveStepInternal = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveStepInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveStepInternal )
	self.id = "MissionObjectiveStepInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 243 )
	self:setTopBottom( true, false, 0, 25 )
	
	local checkbox = CoD.Border.new( menu, controller )
	checkbox:setLeftRight( true, false, 0, 20 )
	checkbox:setTopBottom( true, false, 3, 23 )
	checkbox:setRGB( 0.35, 0.35, 0.36 )
	checkbox:setAlpha( 0 )
	self:addElement( checkbox )
	self.checkbox = checkbox
	
	local checkMark = LUI.UIImage.new()
	checkMark:setLeftRight( true, false, 4, 16 )
	checkMark:setTopBottom( true, false, 7, 19 )
	checkMark:setRGB( 0.35, 0.35, 0.36 )
	checkMark:setAlpha( 0 )
	self:addElement( checkMark )
	self.checkMark = checkMark
	
	local stepText = LUI.UIText.new()
	stepText:setLeftRight( true, false, 0, 243 )
	stepText:setTopBottom( true, false, 0, 25 )
	stepText:setRGB( 0.35, 0.35, 0.36 )
	stepText:setText( Engine.Localize( "MENU_NEW" ) )
	stepText:setTTF( "fonts/default.ttf" )
	stepText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	stepText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( stepText )
	self.stepText = stepText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				checkbox:completeAnimation()
				self.checkbox:setAlpha( 1 )
				self.clipFinished( checkbox, {} )

				checkMark:completeAnimation()
				self.checkMark:setRGB( 0.35, 0.35, 0.36 )
				self.checkMark:setAlpha( 0 )
				self.clipFinished( checkMark, {} )

				stepText:completeAnimation()
				self.stepText:setLeftRight( true, false, 23, 243 )
				self.stepText:setTopBottom( true, false, 0, 25 )
				self.stepText:setRGB( 0.35, 0.35, 0.36 )
				self.clipFinished( stepText, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				checkbox:completeAnimation()
				self.checkbox:setAlpha( 1 )
				self.clipFinished( checkbox, {} )

				checkMark:completeAnimation()
				self.checkMark:setRGB( 0.41, 0.74, 0.27 )
				self.checkMark:setAlpha( 1 )
				self.clipFinished( checkMark, {} )

				stepText:completeAnimation()
				self.stepText:setLeftRight( true, false, 23, 243 )
				self.stepText:setTopBottom( true, false, 0, 25 )
				self.stepText:setRGB( 0.41, 0.74, 0.27 )
				self.clipFinished( stepText, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				checkbox:completeAnimation()
				self.checkbox:setLeftRight( true, false, 0, 20 )
				self.checkbox:setTopBottom( true, false, 3, 23 )
				self.checkbox:setAlpha( 1 )
				self.clipFinished( checkbox, {} )

				checkMark:completeAnimation()
				self.checkMark:setRGB( 0.24, 0.24, 0.24 )
				self.checkMark:setAlpha( 0 )
				self.clipFinished( checkMark, {} )

				stepText:completeAnimation()
				self.stepText:setRGB( 0.35, 0.35, 0.36 )
				self.clipFinished( stepText, {} )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				checkbox:completeAnimation()
				self.checkbox:setAlpha( 1 )
				self.clipFinished( checkbox, {} )

				checkMark:completeAnimation()
				self.checkMark:setRGB( 1, 0.07, 0.07 )
				self.checkMark:setAlpha( 1 )
				self.clipFinished( checkMark, {} )

				stepText:completeAnimation()
				self.stepText:setLeftRight( true, false, 23, 243 )
				self.stepText:setTopBottom( true, false, 0, 25 )
				self.stepText:setRGB( 1, 0.07, 0.07 )
				self.clipFinished( stepText, {} )
			end
		},
		Description = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				checkbox:completeAnimation()
				self.checkbox:setAlpha( 0 )
				self.clipFinished( checkbox, {} )

				checkMark:completeAnimation()
				self.checkMark:setAlpha( 0 )
				self.clipFinished( checkMark, {} )

				stepText:completeAnimation()
				self.stepText:setLeftRight( true, false, 0, 243 )
				self.stepText:setTopBottom( true, false, 0, 25 )
				self.stepText:setRGB( 0.35, 0.35, 0.36 )
				self.clipFinished( stepText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.checkbox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

