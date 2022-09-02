-- 85c7d9f56b92e6386f0e3cb9f5e0ce14
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Progress = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Progress.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_LockedTransmission_Progress )
	self.id = "ChooseCharacterLoadout_CardBack_LockedTransmission_Progress"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 486 )
	self:setTopBottom( true, false, 0, 35 )
	
	local progressFill = LUI.UIImage.new()
	progressFill:setLeftRight( true, true, 0, 0 )
	progressFill:setTopBottom( false, false, 7.25, 17.25 )
	progressFill:setRGB( 0.87, 0.99, 1 )
	progressFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	progressFill:setShaderVector( 1, 0, 0, 0, 0 )
	progressFill:setShaderVector( 2, 1, 0, 0, 0 )
	progressFill:setShaderVector( 3, 0, 0, 0, 0 )
	progressFill:linkToElementModel( self, "assignmentProgress", true, function ( model )
		local assignmentProgress = Engine.GetModelValue( model )
		if assignmentProgress then
			progressFill:setShaderVector( 0, CoD.GetVectorComponentFromString( assignmentProgress, 1 ), CoD.GetVectorComponentFromString( assignmentProgress, 2 ), CoD.GetVectorComponentFromString( assignmentProgress, 3 ), CoD.GetVectorComponentFromString( assignmentProgress, 4 ) )
		end
	end )
	self:addElement( progressFill )
	self.progressFill = progressFill
	
	local progressBorder = CoD.Border.new( menu, controller )
	progressBorder:setLeftRight( true, true, 0, 0 )
	progressBorder:setTopBottom( false, false, 7.25, 17.25 )
	progressBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( progressBorder )
	self.progressBorder = progressBorder
	
	local progressLabel = LUI.UITightText.new()
	progressLabel:setLeftRight( true, false, 0, 50 )
	progressLabel:setTopBottom( true, false, 0, 20 )
	progressLabel:setRGB( 0.82, 0.98, 1 )
	progressLabel:setAlpha( 0.8 )
	progressLabel:setText( Engine.Localize( "MPUI_PROGRESS" ) )
	progressLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( progressLabel )
	self.progressLabel = progressLabel
	
	local progressDisplayString = LUI.UITightText.new()
	progressDisplayString:setLeftRight( false, true, -35, 0 )
	progressDisplayString:setTopBottom( true, false, 0, 20 )
	progressDisplayString:setRGB( 0.82, 0.98, 1 )
	progressDisplayString:setAlpha( 0.8 )
	progressDisplayString:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	progressDisplayString:linkToElementModel( self, "assignmentProgressString", true, function ( model )
		local assignmentProgressString = Engine.GetModelValue( model )
		if assignmentProgressString then
			progressDisplayString:setText( assignmentProgressString )
		end
	end )
	self:addElement( progressDisplayString )
	self.progressDisplayString = progressDisplayString
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				progressFill:completeAnimation()
				self.progressFill:setAlpha( 1 )
				self.clipFinished( progressFill, {} )

				progressBorder:completeAnimation()
				self.progressBorder:setAlpha( 1 )
				self.clipFinished( progressBorder, {} )

				progressLabel:completeAnimation()
				self.progressLabel:setAlpha( 0.8 )
				self.clipFinished( progressLabel, {} )

				progressDisplayString:completeAnimation()
				self.progressDisplayString:setAlpha( 0.8 )
				self.clipFinished( progressDisplayString, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				progressFill:completeAnimation()
				self.progressFill:setAlpha( 0 )
				self.clipFinished( progressFill, {} )

				progressBorder:completeAnimation()
				self.progressBorder:setAlpha( 0 )
				self.clipFinished( progressBorder, {} )

				progressLabel:completeAnimation()
				self.progressLabel:setAlpha( 0 )
				self.clipFinished( progressLabel, {} )

				progressDisplayString:completeAnimation()
				self.progressDisplayString:setAlpha( 0 )
				self.clipFinished( progressDisplayString, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "assignmentProgressString" )
			end
		}
	} )
	self:linkToElementModel( self, "assignmentProgressString", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "assignmentProgressString"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.progressBorder:close()
		element.progressFill:close()
		element.progressDisplayString:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

