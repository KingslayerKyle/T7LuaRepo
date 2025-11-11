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
	self:setLeftRight( 0, 0, 0, 729 )
	self:setTopBottom( 0, 0, 0, 52 )
	
	local progressFill = LUI.UIImage.new()
	progressFill:setLeftRight( 0, 1, 0, 0 )
	progressFill:setTopBottom( 0.5, 0.5, 11, 26 )
	progressFill:setRGB( 0.87, 0.99, 1 )
	progressFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	progressFill:setShaderVector( 1, 0, 0, 0, 0 )
	progressFill:setShaderVector( 2, 1, 0, 0, 0 )
	progressFill:setShaderVector( 3, 0, 0, 0, 0 )
	progressFill:setShaderVector( 4, 0, 0, 0, 0 )
	progressFill:linkToElementModel( self, "assignmentProgress", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressFill:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( progressFill )
	self.progressFill = progressFill
	
	local progressBorder = CoD.Border.new( menu, controller )
	progressBorder:setLeftRight( 0, 1, 0, 0 )
	progressBorder:setTopBottom( 0.5, 0.5, 11, 26 )
	progressBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( progressBorder )
	self.progressBorder = progressBorder
	
	local progressLabel = LUI.UITightText.new()
	progressLabel:setLeftRight( 0, 0, 0, 75 )
	progressLabel:setTopBottom( 0, 0, 0, 30 )
	progressLabel:setRGB( 0.82, 0.98, 1 )
	progressLabel:setAlpha( 0.8 )
	progressLabel:setText( Engine.Localize( "MPUI_PROGRESS" ) )
	progressLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( progressLabel )
	self.progressLabel = progressLabel
	
	local progressDisplayString = LUI.UITightText.new()
	progressDisplayString:setLeftRight( 1, 1, -52, 0 )
	progressDisplayString:setTopBottom( 0, 0, 0, 30 )
	progressDisplayString:setRGB( 0.82, 0.98, 1 )
	progressDisplayString:setAlpha( 0.8 )
	progressDisplayString:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	progressDisplayString:linkToElementModel( self, "assignmentProgressString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressDisplayString:setText( modelValue )
		end
	end )
	self:addElement( progressDisplayString )
	self.progressDisplayString = progressDisplayString
	
	self.resetProperties = function ()
		progressDisplayString:completeAnimation()
		progressLabel:completeAnimation()
		progressBorder:completeAnimation()
		progressFill:completeAnimation()
		progressDisplayString:setAlpha( 0.8 )
		progressLabel:setAlpha( 0.8 )
		progressBorder:setAlpha( 1 )
		progressFill:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.progressBorder:close()
		self.progressFill:close()
		self.progressDisplayString:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

