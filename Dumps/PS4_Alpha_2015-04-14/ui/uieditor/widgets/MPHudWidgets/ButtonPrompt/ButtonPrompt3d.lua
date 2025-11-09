local ButtonPrompt3d_Recenter = function ( self )
	local labelWidth = self.nameLabel:getTextWidth()
	local left, top, right, bottom = self.nameLabel:getLocalRect()
	local requirementWidth = self.requirementLabel:getTextWidth()
	local totalWidth = left + math.max( labelWidth, requirementWidth ) + 7
	self:setLeftRight( false, false, -totalWidth / 2, totalWidth / 2 )
end

local ButtonPrompt3d_SetupEntityContainer = function ( self, event )
	if event.objId then
		self.objIndex = event.objId
		local objectiveName = self.objective.id
		local promptText = self.objective["3d_prompt_text"]
		local promptImage = self.objective["3d_prompt_image"]
		local promptZOffset = self.objective["3d_prompt_z_offset"]
		self:setLeftRight( false, false, -128, 128 )
		self:setTopBottom( false, false, -32, 32 )
		self:setupInteractivePrompt( self.objIndex, 0, 0, promptZOffset )
		self:setupInterPromptObjectiveType( true )
		self:setupInterPromptHideOutRange( true )
		if promptText ~= nil then
			self.nameLabel:setText( Engine.Localize( promptText ) )
		else
			self.nameLabel:setText( "" )
		end
		self.iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		self.iconImage:setImage( RegisterImage( promptImage ) )
	end
end

local PreLoadFunc = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local interactivePromptModel = Engine.CreateModel( perControllerModel, "interactivePrompt" )
	Engine.CreateModel( interactivePromptModel, "activeActionEntityText" )
	Engine.CreateModel( interactivePromptModel, "activeObjectiveID" )
	Engine.CreateModel( interactivePromptModel, "objectiveTextColor" )
end

local PostLoadFunc = function ( self )
	self.setupEntity = ButtonPrompt3d_SetupEntityContainer
	self.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
	self.recenter = ButtonPrompt3d_Recenter
end

CoD.ButtonPrompt3d = InheritFrom( LUI.UIElement )
CoD.ButtonPrompt3d.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ButtonPrompt3d )
	self.id = "ButtonPrompt3d"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 64 )
	
	local requirementLabel = LUI.UITightText.new()
	requirementLabel:setLeftRight( true, false, 64, 319 )
	requirementLabel:setTopBottom( true, false, 32, 57 )
	requirementLabel:setRGB( 1, 1, 1 )
	requirementLabel:setAlpha( 0 )
	requirementLabel:setTTF( "fonts/default.ttf" )
	requirementLabel:subscribeToGlobalModel( controller, "InteractivePrompt", "activeActionEntityText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			requirementLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( requirementLabel )
	self.requirementLabel = requirementLabel
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 64, 172 )
	nameLabel:setTopBottom( true, false, 2, 32 )
	nameLabel:setText( Engine.Localize( "Bio-Cache" ) )
	nameLabel:setTTF( "fonts/default.ttf" )
	nameLabel:subscribeToGlobalModel( controller, "InteractivePrompt", "objectiveTextColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setRGB( modelValue )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( true, false, 0, 64 )
	iconImage:setTopBottom( true, false, 0, 64 )
	iconImage:setRGB( 1, 1, 1 )
	iconImage:setImage( RegisterImage( "uie_menu_sfmap_war_hl" ) )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( true, false, 2.5, 61.5 )
	progressMeter:setTopBottom( true, false, 2.5, 61.5 )
	progressMeter:setRGB( 1, 1, 1 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_thick" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	progressMeter:linkToElementModel( self, "progress", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressMeter:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 1 )
				self.clipFinished( requirementLabel, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 1 )
				self.clipFinished( progressMeter, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				self.clipFinished( requirementLabel, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )
			end
		},
		HideRequirementLabel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				self.clipFinished( requirementLabel, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 1 )
				self.clipFinished( progressMeter, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsObjectiveHidden( element, controller )
			end
		},
		{
			stateName = "HideRequirementLabel",
			condition = function ( menu, element, event )
				return IsObjectiveRequirementLabelHidden( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )
	self:linkToElementModel( self, "clientUseMask", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientUseMask"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "interactivePrompt.activeObjectiveID" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "interactivePrompt.activeObjectiveID"
		} )
	end )
	self.close = function ( self )
		self.requirementLabel:close()
		self.nameLabel:close()
		self.progressMeter:close()
		CoD.ButtonPrompt3d.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

