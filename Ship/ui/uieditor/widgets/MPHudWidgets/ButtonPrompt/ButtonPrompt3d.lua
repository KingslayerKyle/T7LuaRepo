-- 71f15aeb75d99da9c0af5eb6ff061e7f
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = f1_arg0.nameLabel:getTextWidth()
	local f1_local1, f1_local2, f1_local3, f1_local4 = f1_arg0.nameLabel:getLocalRect()
	local f1_local5 = f1_local1 + math.max( f1_local0, f1_arg0.requirementLabel:getTextWidth() ) + 7
	f1_arg0:setLeftRight( false, false, -f1_local5 / 2, f1_local5 / 2 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg1.objId then
		f2_arg0.objIndex = f2_arg1.objId
		local f2_local0 = f2_arg0.objective.id
		local f2_local1 = f2_arg0.objective["3d_prompt_text"]
		local f2_local2 = f2_arg0.objective["3d_prompt_image"]
		local f2_local3 = f2_arg0.objective["3d_prompt_z_offset"]
		f2_arg0:setLeftRight( false, false, -128, 128 )
		f2_arg0:setTopBottom( false, false, -32, 32 )
		f2_arg0:setupInteractivePrompt( f2_arg0.objIndex, 0, 0, f2_local3 )
		f2_arg0:setupInterPromptObjectiveType( true )
		f2_arg0:setupInterPromptHideOutRange( true )
		if f2_local1 ~= nil then
			f2_arg0.nameLabel:setText( Engine.Localize( f2_local1 ) )
		else
			f2_arg0.nameLabel:setText( "" )
		end
		f2_arg0.iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		f2_arg0.iconImage:setImage( RegisterImage( f2_local2 ) )
	end
end

local PreLoadFunc = function ( self, controller )
	local f3_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "interactivePrompt" )
	Engine.CreateModel( f3_local0, "activeActionEntityText" )
	Engine.CreateModel( f3_local0, "activeObjectiveID" )
	Engine.CreateModel( f3_local0, "objectiveTextColor" )
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.setupEntity = f0_local1
	f4_arg0.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
	f4_arg0.recenter = f0_local0
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
	requirementLabel:setAlpha( 0 )
	requirementLabel:setTTF( "fonts/default.ttf" )
	requirementLabel:subscribeToGlobalModel( controller, "InteractivePrompt", "activeActionEntityText", function ( model )
		local activeActionEntityText = Engine.GetModelValue( model )
		if activeActionEntityText then
			requirementLabel:setText( Engine.Localize( activeActionEntityText ) )
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
		local objectiveTextColor = Engine.GetModelValue( model )
		if objectiveTextColor then
			nameLabel:setRGB( objectiveTextColor )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( true, false, 0, 64 )
	iconImage:setTopBottom( true, false, 0, 64 )
	iconImage:setImage( RegisterImage( "uie_menu_sfmap_war_hl" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( true, false, 2.5, 61.5 )
	progressMeter:setTopBottom( true, false, 2.5, 61.5 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_thick" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	progressMeter:linkToElementModel( self, "progress", true, function ( model )
		local progress = Engine.GetModelValue( model )
		if progress then
			progressMeter:setShaderVector( 0, CoD.GetVectorComponentFromString( progress, 1 ), CoD.GetVectorComponentFromString( progress, 2 ), CoD.GetVectorComponentFromString( progress, 3 ), CoD.GetVectorComponentFromString( progress, 4 ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.requirementLabel:close()
		element.nameLabel:close()
		element.progressMeter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
